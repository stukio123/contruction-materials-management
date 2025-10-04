package com.example.resource;

import java.util.List;

public interface ResourceQueryService {
    ResourceQueryDto getProductById(Long id);
    List<ResourceQueryDto> getProducts();
}
