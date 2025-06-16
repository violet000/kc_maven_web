package org.example.kc_maven_web.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.kc_maven_web.entity.CashBox;
import java.util.List;

@Mapper
public interface CashBoxMapper extends BaseMapper<CashBox> {
    
    @Select("SELECT * FROM cash_box WHERE point_code = #{pointCode}")
    List<CashBox> selectByPointCode(String pointCode);
} 