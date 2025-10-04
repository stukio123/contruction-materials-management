package com.example.resource.mapper;

import com.example.resource.ResourceQueryDto;
import com.example.resource.response.ResourceQueryResponse;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface ResourceMapper {
    ResourceMapper INSTANCE = Mappers.getMapper(ResourceMapper.class);

    ResourceQueryResponse mapToResponse(ResourceQueryDto resourceQueryDto);

    List<ResourceQueryResponse> mapToResponseList(List<ResourceQueryDto> resourceQueryDtoList);
}
