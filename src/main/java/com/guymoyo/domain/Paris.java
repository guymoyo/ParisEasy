package com.guymoyo.domain;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findParisesByRencontre" })
public class Paris {

    @ManyToOne
    private Rencontre rencontre;

    @ManyToOne
    private CategoryParis categoryParis;

    @ManyToOne
    private Event event;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH :mm:ss")
    private Date dateOfCreation;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH :mm:ss")
    private Date dateOfClose;

    private BigDecimal cote;

    @Enumerated
    private Etat etat;

    @ManyToOne
    private UserAccount createdBy;

    public Paris(Rencontre rencontre, CategoryParis categoryParis, Event event, Date dateOfCreation, Date dateOfClose, Etat etat, UserAccount createdBy) {
        super();
        this.rencontre = rencontre;
        this.categoryParis = categoryParis;
        this.event = event;
        this.dateOfCreation = dateOfCreation;
        this.dateOfClose = dateOfClose;
        this.etat = etat;
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(rencontre);
        builder.append(", ");
        builder.append(categoryParis);
        builder.append(", ");
        builder.append(event);
        builder.append(", ");
        builder.append(cote);
        builder.append(", ");
        return builder.toString();
    }
}
