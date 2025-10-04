package com.example.exception;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NotFoundException extends RuntimeException{
    private String message;
    private String ErrorCode;

    public NotFoundException(String message, String ErrorCode) {
        this.message = message;
        this.ErrorCode = ErrorCode;
    }
}
