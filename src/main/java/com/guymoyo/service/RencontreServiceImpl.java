package com.guymoyo.service;

import java.util.Date;
import java.util.List;



import com.guymoyo.domain.CategoryParis;
import com.guymoyo.domain.Etat;
import com.guymoyo.domain.Event;
import com.guymoyo.domain.Paris;
import com.guymoyo.domain.Rencontre;


public class RencontreServiceImpl implements RencontreService {

	public void saveRencontre(Rencontre rencontre) {
        rencontre.persist();
        rencontre.flush();
        List<CategoryParis> allCategoryParises = CategoryParis.findAllCategoryParises();
		for(CategoryParis cat:allCategoryParises){
       	
			List<Event> allEvents = Event.findAllEvents();
			for(Event evt:allEvents){
				Paris paris = new Paris(rencontre, cat, evt, new Date(), rencontre.getRencontreDate(), Etat.NEUTRE, null);
				paris.persist();
				paris.flush();
			}
        }
    }
}
