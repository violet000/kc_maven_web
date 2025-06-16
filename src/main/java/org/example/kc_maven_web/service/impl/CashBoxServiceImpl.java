package org.example.kc_maven_web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.entity.CashBox;
import org.example.kc_maven_web.mapper.CashBoxMapper;
import org.example.kc_maven_web.service.CashBoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class CashBoxServiceImpl implements CashBoxService {
    
    @Autowired
    private CashBoxMapper cashBoxMapper;
    
    @Override
    public List<CashBox> getCashBoxesByPointCode(String pointCode) {
        log.info("查询当前网点的款箱列表：pointCode={}", pointCode);
        
        List<CashBox> cashBoxes = cashBoxMapper.selectList(
            new LambdaQueryWrapper<CashBox>()
                .eq(CashBox::getPointCode, pointCode)
                .orderByAsc(CashBox::getBoxCode)
        );
        
        log.info("查询结果：{}", cashBoxes);
        return cashBoxes;
    }
    
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateScanStatus(String boxCode, Integer scanStatus) {
        log.info("更新款箱扫描状态：boxCode={}, scanStatus={}", boxCode, scanStatus);
        
        // 先查询款箱是否存在
        CashBox existingBox = cashBoxMapper.selectOne(
            new LambdaQueryWrapper<CashBox>()
                .eq(CashBox::getBoxCode, boxCode)
        );
        
        if (existingBox == null) {
            log.error("款箱不存在：boxCode={}", boxCode);
            return false;
        }
        
        // 使用 LambdaUpdateWrapper 直接更新
        int rows = cashBoxMapper.update(null,
            new LambdaUpdateWrapper<CashBox>()
                .eq(CashBox::getBoxCode, boxCode)
                .set(CashBox::getScanStatus, scanStatus)
                .set(CashBox::getUpdateTime, LocalDateTime.now())
        );
        
        log.info("更新结果：影响行数={}", rows);
        
        // 验证更新是否成功
        CashBox updatedBox = cashBoxMapper.selectOne(
            new LambdaQueryWrapper<CashBox>()
                .eq(CashBox::getBoxCode, boxCode)
        );
        
        boolean success = rows > 0 && updatedBox != null && updatedBox.getScanStatus().equals(scanStatus);
        
        if (success) {
            log.info("款箱状态更新成功：boxCode={}, scanStatus={}", boxCode, scanStatus);
        } else {
            log.error("款箱状态更新失败：boxCode={}, scanStatus={}", boxCode, scanStatus);
        }
        
        return success;
    }

    @Override
    @Transactional
    public Result checkCashBoxes(String pointCode, List<String> cashBoxList) {
        // 1. 查询当前线路下的所有箱子
        List<CashBox> allBoxes = cashBoxMapper.selectByPointCode(pointCode);
        
        // 2. 检查箱子数量是否一致
        if (allBoxes.size() != cashBoxList.size()) {
            return Result.error("扫描的箱子数量与线路箱子总数不一致");
        }

        // 3. 检查箱子编号是否一致
        List<String> allBoxCodes = allBoxes.stream()
                .map(CashBox::getBoxCode)
                .collect(Collectors.toList());
        
        if (!allBoxCodes.containsAll(cashBoxList) || !cashBoxList.containsAll(allBoxCodes)) {
            return Result.error("扫描的箱子与线路箱子不匹配");
        }

        // 4. 检查所有箱子是否都已扫描
        boolean allScanned = allBoxes.stream()
                .allMatch(box -> box.getScanStatus() != null && box.getScanStatus() == 1);

        if (!allScanned) {
            return Result.error("存在未扫描的箱子");
        }

        return Result.success("所有箱子已正确扫描");
    }
} 