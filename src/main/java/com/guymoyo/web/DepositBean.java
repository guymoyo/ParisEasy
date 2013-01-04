package com.guymoyo.web;

import com.guymoyo.domain.Deposit;
import org.springframework.roo.addon.jsf.managedbean.RooJsfManagedBean;
import org.springframework.roo.addon.serializable.RooSerializable;

@RooSerializable
@RooJsfManagedBean(entity = Deposit.class, beanName = "depositBean")
public class DepositBean {
}
