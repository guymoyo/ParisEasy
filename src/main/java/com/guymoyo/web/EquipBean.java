package com.guymoyo.web;

import com.guymoyo.domain.Equip;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Equip.class, beanName = "equipBean")
public class EquipBean {
}
