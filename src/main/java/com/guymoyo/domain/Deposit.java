package com.guymoyo.domain;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Deposit {

    @ManyToOne
    private UserAccount userAccount;

    @NotNull
    private BigDecimal montant;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH :mm:ss")
    private Date dateOfCreation;

    @Size(max = 255)
    private String description;

    @ManyToOne
    private UserAccount createdBy;
}
