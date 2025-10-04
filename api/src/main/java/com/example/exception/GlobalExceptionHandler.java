package com.example.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import java.time.LocalDateTime;

@RestControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(value = { NotFoundException.class })
    public ResponseEntity<ErrorResponse> handleException(NotFoundException e, WebRequest request) {
        ErrorResponse errorResponse = ErrorResponse.builder()
                .timestamp(LocalDateTime.now())
                .errorCode(e.getErrorCode())
                .errorMessage(e.getMessage())
                .path(request.getDescription(false).replace("uri=",""))
                .build();
        return ResponseEntity.status(HttpStatus.OK).body(errorResponse);
    }

}
