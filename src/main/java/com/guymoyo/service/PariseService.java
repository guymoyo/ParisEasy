package com.guymoyo.service;

import org.springframework.roo.addon.layers.service.RooService;

import com.guymoyo.domain.Choix;
import com.guymoyo.domain.Paris;

@RooService(domainTypes = { com.guymoyo.domain.Paris.class })
public interface PariseService {
	
	public Choix transformParisToChoix(Paris paris);
}
