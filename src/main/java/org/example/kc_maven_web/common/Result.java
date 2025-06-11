package org.example.kc_maven_web.common;

import lombok.Data;

@Data
public class Result<T> {
    private String retCode;
    private String retMsg;
    private T retList;

    private Result(String code, String message, T data) {
        this.retCode = code;
        this.retMsg = message;
        this.retList = data;
    }

    public static <T> Result<T> success() {
        return new Result<>("000000", "操作成功", null);
    }

    public static <T> Result<T> success(T data) {
        return new Result<>("000000", "操作成功", data);
    }

    public static <T> Result<T> success(String message, T data) {
        return new Result<>("000000", message, data);
    }

    public static <T> Result<T> error(String message) {
        return new Result<>("999999", message, null);
    }

    public static <T> Result<T> error(String code, String message) {
        return new Result<>(code, message, null);
    }
} 