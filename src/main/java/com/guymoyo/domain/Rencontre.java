package com.guymoyo.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.ManyToOne;
import javax.persistence.PostLoad;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Rencontre {

    @ManyToOne
    private Equip equipeA;

    @ManyToOne
    private Equip equipeB;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH :mm:ss")
    private Date creationDate;

    private String lieu;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH :mm:ss")
    private Date rencontreDate;

    @ManyToOne
    private SportType sporttype;

    @ManyToOne
    private League league;

    @ManyToOne
    private UserAccount createdBy;
    
    @Transient
    private Map<CategoryParis, Map<Event, Paris>> parisMap = new HashMap<CategoryParis, Map<Event, Paris>>();

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(equipeA);
		builder.append(" # ");
		builder.append(equipeB);
		builder.append(", ");
		builder.append(lieu);
		builder.append(", ");
		builder.append(rencontreDate);
		builder.append(", ");
		builder.append(sporttype);
		builder.append(", ");
		builder.append(league);
		return builder.toString();
	}
	
	@PostLoad
	public void onLoadFunction(){
		
		List<Paris> resultList = Paris.findParisesByRencontre(this).getResultList();
		List<CategoryParis> categoryParises = CategoryParis.findAllCategoryParises();
		Map<Event, Paris> paris;
		
		try {
			for(CategoryParis c : categoryParises){
				paris = new HashMap<Event, Paris>();
				for(Paris p:resultList){
					if(p.getCategoryParis().equals(c)){
						paris.put(p.getEvent(), p);
					}
				}
				parisMap.put(c, paris);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}
