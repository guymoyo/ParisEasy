// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.service;

import com.guymoyo.domain.Choix;
import com.guymoyo.service.ChoixService;
import java.util.List;

privileged aspect ChoixService_Roo_Service {
    
    public abstract long ChoixService.countAllChoixes();    
    public abstract void ChoixService.deleteChoix(Choix choix);    
    public abstract Choix ChoixService.findChoix(Long id);    
    public abstract List<Choix> ChoixService.findAllChoixes();    
    public abstract List<Choix> ChoixService.findChoixEntries(int firstResult, int maxResults);    
    public abstract void ChoixService.saveChoix(Choix choix);    
    public abstract Choix ChoixService.updateChoix(Choix choix);    
}