// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Deposit;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Deposit_Roo_Jpa_Entity {
    
    declare @type: Deposit: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Deposit.id;
    
    @Version
    @Column(name = "version")
    private Integer Deposit.version;
    
    public Long Deposit.getId() {
        return this.id;
    }
    
    public void Deposit.setId(Long id) {
        this.id = id;
    }
    
    public Integer Deposit.getVersion() {
        return this.version;
    }
    
    public void Deposit.setVersion(Integer version) {
        this.version = version;
    }
    
}
