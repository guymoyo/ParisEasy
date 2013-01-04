package com.guymoyo.web;

import com.guymoyo.domain.Societe;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Societe.class, beanName = "societeBean")
public class SocieteBean {
}
