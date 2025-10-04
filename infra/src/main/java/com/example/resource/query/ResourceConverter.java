package com.example.resource.query;

import com.example.resource.Resource;
import com.example.resource.ResourceQueryDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface ResourceConverter {

    ResourceConverter INSTANCE = Mappers.getMapper(ResourceConverter.class);

    @Mapping(target = "id", source = "id")
    @Mapping(target = "name", source = "name")
    @Mapping(target = "description", source = "description")
    ResourceQueryDto toDto(Resource resource);


    List<ResourceQueryDto> toDtoList(List<Resource> resources);
}
