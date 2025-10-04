package com.example.resource.response;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ResourceQueryResponse {
    /**
     * Product Id
     */
    private String Id;

    /**
     * Product name
     */
    private String name;
}
