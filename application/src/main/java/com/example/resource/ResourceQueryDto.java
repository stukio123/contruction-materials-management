package com.example.resource;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ResourceQueryDto {
    private String id;
    private String name;
    private String description;
}
