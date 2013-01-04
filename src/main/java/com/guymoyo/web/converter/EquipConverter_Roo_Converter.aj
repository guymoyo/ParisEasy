// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web.converter;

import com.guymoyo.domain.Equip;
import com.guymoyo.service.EquipService;
import com.guymoyo.web.converter.EquipConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect EquipConverter_Roo_Converter {
    
    declare parents: EquipConverter implements Converter;
    
    declare @type: EquipConverter: @FacesConverter("com.guymoyo.web.converter.EquipConverter");
    
    @Autowired
    EquipService EquipConverter.equipService;
    
    public Object EquipConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return equipService.findEquip(id);
    }
    
    public String EquipConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Equip ? ((Equip) value).getId().toString() : "";
    }
    
}