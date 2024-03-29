// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web.converter;

import com.guymoyo.domain.Panier;
import com.guymoyo.service.PanierService;
import com.guymoyo.web.converter.PanierConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect PanierConverter_Roo_Converter {
    
    declare parents: PanierConverter implements Converter;
    
    declare @type: PanierConverter: @FacesConverter("com.guymoyo.web.converter.PanierConverter");
    
    @Autowired
    PanierService PanierConverter.panierService;
    
    public Object PanierConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return panierService.findPanier(id);
    }
    
    public String PanierConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Panier ? ((Panier) value).getId().toString() : "";
    }
    
}
