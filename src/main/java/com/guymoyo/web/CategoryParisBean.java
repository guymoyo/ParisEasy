package com.guymoyo.web;

import com.guymoyo.domain.CategoryParis;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = CategoryParis.class, beanName = "categoryParisBean")
public class CategoryParisBean {
}
