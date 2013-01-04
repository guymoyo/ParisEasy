package com.guymoyo.web;

import com.guymoyo.domain.Paris;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Paris.class, beanName = "parisBean")
public class ParisBean {
}
