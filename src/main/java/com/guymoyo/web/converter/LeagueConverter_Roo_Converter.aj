// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web.converter;

import com.guymoyo.domain.League;
import com.guymoyo.service.LeagueService;
import com.guymoyo.web.converter.LeagueConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect LeagueConverter_Roo_Converter {
    
    declare parents: LeagueConverter implements Converter;
    
    declare @type: LeagueConverter: @FacesConverter("com.guymoyo.web.converter.LeagueConverter");
    
    @Autowired
    LeagueService LeagueConverter.leagueService;
    
    public Object LeagueConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return leagueService.findLeague(id);
    }
    
    public String LeagueConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof League ? ((League) value).getId().toString() : "";
    }
    
}
