// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Equip;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Equip_Roo_Jpa_Entity {
    
    declare @type: Equip: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Equip.id;
    
    @Version
    @Column(name = "version")
    private Integer Equip.version;
    
    public Long Equip.getId() {
        return this.id;
    }
    
    public void Equip.setId(Long id) {
        this.id = id;
    }
    
    public Integer Equip.getVersion() {
        return this.version;
    }
    
    public void Equip.setVersion(Integer version) {
        this.version = version;
    }
    
}
