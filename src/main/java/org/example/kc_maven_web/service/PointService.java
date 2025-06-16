package org.example.kc_maven_web.service;

import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.dto.PointUpdateDTO;

public interface PointService {
    Result updatePointStatus(PointUpdateDTO dto);
} 