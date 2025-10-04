package com.example.resource;

import com.example.manufacturer.Manufacturer;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "resource_manufacturers", schema = "public")
public class ResourceManufacturer {
    @EmbeddedId
    private ResourceManufacturerId id;

    @MapsId("resourceId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "resource_id", nullable = false)
    private Resource resource;

    @MapsId("manufacturerId")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "manufacturer_id", nullable = false)
    private Manufacturer manufacturer;

}