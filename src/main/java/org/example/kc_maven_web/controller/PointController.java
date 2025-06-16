package org.example.kc_maven_web.controller;

import org.example.kc_maven_web.common.Result;
import org.example.kc_maven_web.dto.PointUpdateDTO;
import org.example.kc_maven_web.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/storage/point")
public class PointController {

    @Autowired
    private PointService pointService;

    @PostMapping("/update-status")
    public Result updatePointStatus(@RequestBody PointUpdateDTO dto) {
        return pointService.updatePointStatus(dto);
    }
} 