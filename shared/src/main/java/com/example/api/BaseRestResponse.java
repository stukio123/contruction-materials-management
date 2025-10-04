package com.example.api;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Map;

@Getter
@Setter
@ToString
public class BaseRestResponse {
    private Map<String, String> extParams;
    private String errorCode;
    private String errorMessage;
}
