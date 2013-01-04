package com.guymoyo.domain;

import java.math.BigDecimal;
import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Societe {

    @NotNull
    private String Name;

    private String Address;

    private String CodePostal;

    private String City;

    private String Email;

    private String PhoneNumber;

    private String Fax;

    private String WebPage;

    private BigDecimal TVA;
}
