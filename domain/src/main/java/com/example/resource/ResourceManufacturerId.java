package com.example.resource;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
public class ResourceManufacturerId implements Serializable {
    private static final long serialVersionUID = 1873973128203216121L;
    @Column(name = "resource_id", nullable = false)
    private Long resourceId;

    @Column(name = "manufacturer_id", nullable = false)
    private Long manufacturerId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        ResourceManufacturerId entity = (ResourceManufacturerId) o;
        return Objects.equals(this.resourceId, entity.resourceId) &&
                Objects.equals(this.manufacturerId, entity.manufacturerId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(resourceId, manufacturerId);
    }

}