// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.CategoryParis;
import com.guymoyo.domain.Etat;
import com.guymoyo.domain.Event;
import com.guymoyo.domain.Paris;
import com.guymoyo.domain.Rencontre;
import com.guymoyo.domain.UserAccount;
import java.math.BigDecimal;
import java.util.Date;

privileged aspect Paris_Roo_JavaBean {
    
    public Rencontre Paris.getRencontre() {
        return this.rencontre;
    }
    
    public void Paris.setRencontre(Rencontre rencontre) {
        this.rencontre = rencontre;
    }
    
    public CategoryParis Paris.getCategoryParis() {
        return this.categoryParis;
    }
    
    public void Paris.setCategoryParis(CategoryParis categoryParis) {
        this.categoryParis = categoryParis;
    }
    
    public Event Paris.getEvent() {
        return this.event;
    }
    
    public void Paris.setEvent(Event event) {
        this.event = event;
    }
    
    public Date Paris.getDateOfCreation() {
        return this.dateOfCreation;
    }
    
    public void Paris.setDateOfCreation(Date dateOfCreation) {
        this.dateOfCreation = dateOfCreation;
    }
    
    public Date Paris.getDateOfClose() {
        return this.dateOfClose;
    }
    
    public void Paris.setDateOfClose(Date dateOfClose) {
        this.dateOfClose = dateOfClose;
    }
    
    public BigDecimal Paris.getCote() {
        return this.cote;
    }
    
    public void Paris.setCote(BigDecimal cote) {
        this.cote = cote;
    }
    
    public Etat Paris.getEtat() {
        return this.etat;
    }
    
    public void Paris.setEtat(Etat etat) {
        this.etat = etat;
    }
    
    public UserAccount Paris.getCreatedBy() {
        return this.createdBy;
    }
    
    public void Paris.setCreatedBy(UserAccount createdBy) {
        this.createdBy = createdBy;
    }
    
}