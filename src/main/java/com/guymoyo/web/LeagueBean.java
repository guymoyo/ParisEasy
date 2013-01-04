package com.guymoyo.web;

import com.guymoyo.domain.League;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = League.class, beanName = "leagueBean")
public class LeagueBean {
}
