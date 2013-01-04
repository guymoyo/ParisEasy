// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.web.converter;

import com.guymoyo.domain.Deposit;
import com.guymoyo.service.DepositService;
import com.guymoyo.web.converter.DepositConverter;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import org.springframework.beans.factory.annotation.Autowired;

privileged aspect DepositConverter_Roo_Converter {
    
    declare parents: DepositConverter implements Converter;
    
    declare @type: DepositConverter: @FacesConverter("com.guymoyo.web.converter.DepositConverter");
    
    @Autowired
    DepositService DepositConverter.depositService;
    
    public Object DepositConverter.getAsObject(FacesContext context, UIComponent component, String value) {
        if (value == null || value.length() == 0) {
            return null;
        }
        Long id = Long.parseLong(value);
        return depositService.findDeposit(id);
    }
    
    public String DepositConverter.getAsString(FacesContext context, UIComponent component, Object value) {
        return value instanceof Deposit ? ((Deposit) value).getId().toString() : "";
    }
    
}
