// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.SportType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect SportType_Roo_Jpa_Entity {
    
    declare @type: SportType: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long SportType.id;
    
    @Version
    @Column(name = "version")
    private Integer SportType.version;
    
    public Long SportType.getId() {
        return this.id;
    }
    
    public void SportType.setId(Long id) {
        this.id = id;
    }
    
    public Integer SportType.getVersion() {
        return this.version;
    }
    
    public void SportType.setVersion(Integer version) {
        this.version = version;
    }
    
}
