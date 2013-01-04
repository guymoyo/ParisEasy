package com.guymoyo.web;

import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.stereotype.Component;

import com.guymoyo.domain.CategoryParis;
import com.guymoyo.domain.Event;
import com.guymoyo.domain.Rencontre;
import com.guymoyo.service.RencontreService;



@ManagedBean(name = "frontendBean")
@SessionScoped
@RooSerializable
@Component
public class FrontendBean {
	
	@Autowired
    RencontreService rencontreService;
	
	private List<Rencontre> rencontres;
	
	private List<CategoryParis> categories;
	
	private List<Event> events;
	
	private boolean dataVisible = false;
	
	
	public List<Rencontre> getRencontres() {
		findAllRencontres();
		return rencontres;
	}


	public void setRencontres(List<Rencontre> rencontres) {
		this.rencontres = rencontres;
	}


	public boolean isDataVisible() {
		return dataVisible;
	}


	public void setDataVisible(boolean dataVisible) {
		this.dataVisible = dataVisible;
	}


	public String findAllRencontres() {
        rencontres = rencontreService.findAllRencontres();
        dataVisible = !rencontres.isEmpty();
        return null;
    }


	public List<CategoryParis> getCategories() {
		return CategoryParis.findAllCategoryParises();
	}


	public void setCategories(List<CategoryParis> categories) {
		this.categories = categories;
	}


	public List<Event> getEvents() {
		return Event.findAllEvents();
	}


	public void setEvents(List<Event> events) {
		this.events = events;
	}
}
