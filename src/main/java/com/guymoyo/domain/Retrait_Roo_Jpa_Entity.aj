// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Retrait;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Retrait_Roo_Jpa_Entity {
    
    declare @type: Retrait: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Retrait.id;
    
    @Version
    @Column(name = "version")
    private Integer Retrait.version;
    
    public Long Retrait.getId() {
        return this.id;
    }
    
    public void Retrait.setId(Long id) {
        this.id = id;
    }
    
    public Integer Retrait.getVersion() {
        return this.version;
    }
    
    public void Retrait.setVersion(Integer version) {
        this.version = version;
    }
    
}
