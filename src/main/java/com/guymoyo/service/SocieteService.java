package com.guymoyo.service;

import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { com.guymoyo.domain.Societe.class })
public interface SocieteService {
	
	public String calcul();
}
