// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.service;

import com.guymoyo.domain.Paris;
import com.guymoyo.service.PariseService;
import java.util.List;

privileged aspect PariseService_Roo_Service {
    
    public abstract long PariseService.countAllParises();    
    public abstract void PariseService.deleteParis(Paris paris);    
    public abstract Paris PariseService.findParis(Long id);    
    public abstract List<Paris> PariseService.findAllParises();    
    public abstract List<Paris> PariseService.findParisEntries(int firstResult, int maxResults);    
    public abstract void PariseService.saveParis(Paris paris);    
    public abstract Paris PariseService.updateParis(Paris paris);    
}