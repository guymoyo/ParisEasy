// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Equip;
import com.guymoyo.domain.UserAccount;

privileged aspect Equip_Roo_JavaBean {
    
    public String Equip.getName() {
        return this.name;
    }
    
    public void Equip.setName(String name) {
        this.name = name;
    }
    
    public String Equip.getDescription() {
        return this.description;
    }
    
    public void Equip.setDescription(String description) {
        this.description = description;
    }
    
    public byte[] Equip.getImage() {
        return this.image;
    }
    
    public void Equip.setImage(byte[] image) {
        this.image = image;
    }
    
    public UserAccount Equip.getCreatedBy() {
        return this.createdBy;
    }
    
    public void Equip.setCreatedBy(UserAccount createdBy) {
        this.createdBy = createdBy;
    }
    
}
