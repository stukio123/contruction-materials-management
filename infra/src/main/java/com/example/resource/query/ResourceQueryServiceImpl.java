package com.example.resource.query;

import com.example.resource.Resource;
import com.example.resource.ResourceQueryDto;
import com.example.resource.ResourceQueryService;
import com.example.resource.ResourceRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ResourceQueryServiceImpl implements ResourceQueryService {

    private final ResourceRepository resourceRepository;

    @Override
    public ResourceQueryDto getProductById(Long id) {
        Resource resource = resourceRepository.findById(id).orElseThrow(() -> new RuntimeException("resource not found"));
        return ResourceConverter.INSTANCE.toDto(resource);
    }

    @Override
    public List<ResourceQueryDto> getProducts() {
        return ResourceConverter.INSTANCE.toDtoList(resourceRepository.findAll());
    }
}
