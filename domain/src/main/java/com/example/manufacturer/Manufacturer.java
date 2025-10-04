package com.example.manufacturer;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "manufacturers", schema = "public")
public class Manufacturer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "country", length = 100)
    private String country;

    @Column(name = "contact_info", length = Integer.MAX_VALUE)
    private String contactInfo;

}