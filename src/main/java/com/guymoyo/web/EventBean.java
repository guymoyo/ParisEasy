package com.guymoyo.web;

import com.guymoyo.domain.Event;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Event.class, beanName = "eventBean")
public class EventBean {
}
