// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Deposit;
import com.guymoyo.domain.DepositDataOnDemand;
import com.guymoyo.domain.UserAccountDataOnDemand;
import com.guymoyo.service.DepositService;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DepositDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DepositDataOnDemand: @Component;
    
    private Random DepositDataOnDemand.rnd = new SecureRandom();
    
    private List<Deposit> DepositDataOnDemand.data;
    
    @Autowired
    private UserAccountDataOnDemand DepositDataOnDemand.userAccountDataOnDemand;
    
    @Autowired
    DepositService DepositDataOnDemand.depositService;
    
    public Deposit DepositDataOnDemand.getNewTransientDeposit(int index) {
        Deposit obj = new Deposit();
        setDateOfCreation(obj, index);
        setDescription(obj, index);
        setMontant(obj, index);
        return obj;
    }
    
    public void DepositDataOnDemand.setDateOfCreation(Deposit obj, int index) {
        Date dateOfCreation = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setDateOfCreation(dateOfCreation);
    }
    
    public void DepositDataOnDemand.setDescription(Deposit obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void DepositDataOnDemand.setMontant(Deposit obj, int index) {
        BigDecimal montant = BigDecimal.valueOf(index);
        obj.setMontant(montant);
    }
    
    public Deposit DepositDataOnDemand.getSpecificDeposit(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Deposit obj = data.get(index);
        Long id = obj.getId();
        return depositService.findDeposit(id);
    }
    
    public Deposit DepositDataOnDemand.getRandomDeposit() {
        init();
        Deposit obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return depositService.findDeposit(id);
    }
    
    public boolean DepositDataOnDemand.modifyDeposit(Deposit obj) {
        return false;
    }
    
    public void DepositDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = depositService.findDepositEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Deposit' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Deposit>();
        for (int i = 0; i < 10; i++) {
            Deposit obj = getNewTransientDeposit(i);
            try {
                depositService.saveDeposit(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}