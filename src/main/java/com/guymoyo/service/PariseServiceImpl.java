package com.guymoyo.service;

import java.math.BigDecimal;

import com.guymoyo.domain.Choix;
import com.guymoyo.domain.Paris;


public class PariseServiceImpl implements PariseService {
	
	public Choix transformParisToChoix(Paris paris){
	
		return new Choix(paris, BigDecimal.ZERO, BigDecimal.ZERO);
	}
}
