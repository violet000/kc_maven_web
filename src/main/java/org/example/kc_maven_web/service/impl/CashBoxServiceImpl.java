package org.example.kc_maven_web.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import org.example.kc_maven_web.entity.CashBox;
import org.example.kc_maven_web.mapper.CashBoxMapper;
import org.example.kc_maven_web.service.CashBoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.util.List;

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
} 