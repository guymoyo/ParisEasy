// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Choix;
import com.guymoyo.domain.Panier;
import com.guymoyo.domain.UserAccount;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

privileged aspect Panier_Roo_JavaBean {
    
    public UserAccount Panier.getUserAccount() {
        return this.userAccount;
    }
    
    public void Panier.setUserAccount(UserAccount userAccount) {
        this.userAccount = userAccount;
    }
    
    public Date Panier.getDateOfCreation() {
        return this.dateOfCreation;
    }
    
    public void Panier.setDateOfCreation(Date dateOfCreation) {
        this.dateOfCreation = dateOfCreation;
    }
    
    public BigDecimal Panier.getMontantTotal() {
        return this.montantTotal;
    }
    
    public void Panier.setMontantTotal(BigDecimal montantTotal) {
        this.montantTotal = montantTotal;
    }
    
    public BigDecimal Panier.getGainTotal() {
        return this.gainTotal;
    }
    
    public void Panier.setGainTotal(BigDecimal gainTotal) {
        this.gainTotal = gainTotal;
    }
    
    public List<Choix> Panier.getListChoix() {
        return this.listChoix;
    }
    
    public void Panier.setListChoix(List<Choix> listChoix) {
        this.listChoix = listChoix;
    }
    
    public int Panier.getNbreItem() {
        return this.nbreItem;
    }
    
    public void Panier.setNbreItem(int nbreItem) {
        this.nbreItem = nbreItem;
    }
    
}