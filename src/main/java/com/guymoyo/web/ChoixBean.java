package com.guymoyo.web;

import com.guymoyo.domain.Choix;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Choix.class, beanName = "choixBean")
public class ChoixBean {
}
