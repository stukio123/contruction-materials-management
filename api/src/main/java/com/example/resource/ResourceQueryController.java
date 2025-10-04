package com.example.resource;

import com.example.resource.mapper.ResourceMapper;
import com.example.resource.response.ResourceQueryResponse;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController(value = "api/v1/resources")
public class ResourceQueryController {
    private final ResourceQueryService resourceQueryService;

    @GetMapping("/{id}")
    public ResourceQueryResponse getProductById(@PathVariable Long id) {
        return ResourceMapper.INSTANCE.mapToResponse(resourceQueryService.getProductById(id));
    }

    @GetMapping("")
    public List<ResourceQueryResponse> getProducts() {
        return ResourceMapper.INSTANCE.mapToResponseList(resourceQueryService.getProducts());
    }
}
