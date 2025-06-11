package org.example.kc_maven_web.service;

import org.example.kc_maven_web.entity.CashBox;
import java.util.List;

public interface CashBoxService {
    /**
     * 根据线路编号查询款箱列表
     * @param pointCode 网点编号
     * @return 款箱列表
     */
    List<CashBox> getCashBoxesByPointCode(String pointCode);
    
    /**
     * 更新款箱扫描状态
     * @param boxCode 箱子编号
     * @param scanStatus 扫描状态
     * @return 是否更新成功
     */
    boolean updateScanStatus(String boxCode, Integer scanStatus);
}