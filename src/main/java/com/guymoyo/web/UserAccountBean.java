package com.guymoyo.web;

import com.guymoyo.domain.UserAccount;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = UserAccount.class, beanName = "userAccountBean")
public class UserAccountBean {
}
