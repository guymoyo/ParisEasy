package com.guymoyo.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Panier {

    @ManyToOne
    private UserAccount userAccount;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH :mm:ss")
    private Date dateOfCreation;

    @NotNull
    private BigDecimal montantTotal;

    @NotNull
    private BigDecimal gainTotal;
    
    @Transient
    private List<Choix> listChoix= new ArrayList<Choix>();
    
    @Transient
    private int nbreItem;
    
    public void calculMontantTotal(){
    	
    }
    
    public void nbreItem() {
    	nbreItem = listChoix.size();
	}
}
