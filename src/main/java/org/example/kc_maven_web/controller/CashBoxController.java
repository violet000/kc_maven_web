package org.example.kc_maven_web.controller;

import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.entity.CashBox;
import org.example.kc_maven_web.service.CashBoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/storage/cash-box")
public class CashBoxController {
    
    @Autowired
    private CashBoxService cashBoxService;
    
    /**
     * 根据线路编号查询款箱列表
     * @param pointCode 网点编号
     * @return 款箱列表
     */
    @GetMapping("/list")
    public Result<List<CashBox>> getCashBoxesByPointCode(@RequestParam String pointCode) {
        List<CashBox> cashBoxes = cashBoxService.getCashBoxesByPointCode(pointCode);
        return Result.success(cashBoxes);
    }
    
    /**
     * 更新款箱扫描状态
     * @param boxCode 箱子编号
     * @param scanStatus 扫描状态
     * @return 更新结果
     */
    @PostMapping("/scan-status")
    public Result<Boolean> updateScanStatus(@RequestBody CashBox cashBox) {
        boolean success = cashBoxService.updateScanStatus(cashBox.getBoxCode(), cashBox.getScanStatus());
        return Result.success(success);
    }
} 