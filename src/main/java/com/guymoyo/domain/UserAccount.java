package com.guymoyo.domain;

import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.classpath.operations.jsr303.RooUploadedFile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class UserAccount {

    @NotNull
    @Column(unique = true)
    @Size(min = 3)
    private String username;

    @NotNull
    @Column(unique = true)
    @Size(min = 5)
    private String password;

    @NotNull
    @Enumerated
    private RoleName roles;

    private String firstName;

    @NotNull
    private String lastName;

    private String fullName;

    private BigDecimal account;

    @Enumerated
    private Gender gender;

    @Column(unique = true)
    private String identityNumber;

    private String phoneNumber;

    private String email;

    private String nationality;

    private String profession;

    @RooUploadedFile(contentType = "image/jpeg")
    @Lob
    private byte[] image;

    private Boolean blackList;

    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date entryDate;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(fullName);
		builder.append(", ");
		builder.append(phoneNumber);
		builder.append(", ");
		builder.append(email);
		return builder.toString();
	}
	
	
	public void compozeFullName(){
		this.fullName = firstName+" "+lastName;
	}
	
	@PrePersist
	public void prepersist(){
		compozeFullName();
	}
	
	@PreUpdate
	public void preupdate(){
		compozeFullName();
	}

}
