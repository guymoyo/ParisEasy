// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.service;

import com.guymoyo.domain.Societe;
import com.guymoyo.service.SocieteService;
import java.util.List;

privileged aspect SocieteService_Roo_Service {
    
    public abstract long SocieteService.countAllSocietes();    
    public abstract void SocieteService.deleteSociete(Societe societe);    
    public abstract Societe SocieteService.findSociete(Long id);    
    public abstract List<Societe> SocieteService.findAllSocietes();    
    public abstract List<Societe> SocieteService.findSocieteEntries(int firstResult, int maxResults);    
    public abstract void SocieteService.saveSociete(Societe societe);    
    public abstract Societe SocieteService.updateSociete(Societe societe);    
}
