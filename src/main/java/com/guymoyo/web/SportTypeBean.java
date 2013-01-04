package com.guymoyo.web;

import com.guymoyo.domain.SportType;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = SportType.class, beanName = "sportTypeBean")
public class SportTypeBean {
}
