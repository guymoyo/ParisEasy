package com.guymoyo.domain;

import java.math.BigDecimal;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Choix {

    @ManyToOne
    private Paris paris;

    @NotNull
    private BigDecimal montantParis;

    @NotNull
    private BigDecimal gain;

    @ManyToOne
    private Panier panier;

	public Choix(Paris paris, BigDecimal montantParis, BigDecimal gain) {
		super();
		this.paris = paris;
		this.montantParis = montantParis;
		this.gain = gain;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(paris);
		builder.append(", ");
		builder.append(montantParis);
		builder.append(", ");
		builder.append(gain);
		return builder.toString();
	}
	
}
