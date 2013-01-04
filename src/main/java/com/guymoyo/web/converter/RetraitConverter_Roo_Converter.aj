// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web.converter;

import com.guymoyo.domain.Retrait;
import com.guymoyo.service.RetraitService;
import com.guymoyo.web.converter.RetraitConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect RetraitConverter_Roo_Converter {
    
    declare parents: RetraitConverter implements Converter;
    
    declare @type: RetraitConverter: @FacesConverter("com.guymoyo.web.converter.RetraitConverter");
    
    @Autowired
    RetraitService RetraitConverter.retraitService;
    
    public Object RetraitConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return retraitService.findRetrait(id);
    }
    
    public String RetraitConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Retrait ? ((Retrait) value).getId().toString() : "";
    }
    
}
