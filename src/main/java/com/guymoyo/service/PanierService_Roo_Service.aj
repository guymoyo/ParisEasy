// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.service;

import com.guymoyo.domain.Panier;
import com.guymoyo.service.PanierService;
import java.util.List;

privileged aspect PanierService_Roo_Service {
    
    public abstract long PanierService.countAllPaniers();    
    public abstract void PanierService.deletePanier(Panier panier);    
    public abstract Panier PanierService.findPanier(Long id);    
    public abstract List<Panier> PanierService.findAllPaniers();    
    public abstract List<Panier> PanierService.findPanierEntries(int firstResult, int maxResults);    
    public abstract void PanierService.savePanier(Panier panier);    
    public abstract Panier PanierService.updatePanier(Panier panier);    
}