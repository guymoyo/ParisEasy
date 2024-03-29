// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.EquipDataOnDemand;
import com.guymoyo.domain.LeagueDataOnDemand;
import com.guymoyo.domain.Rencontre;
import com.guymoyo.domain.RencontreDataOnDemand;
import com.guymoyo.domain.SportTypeDataOnDemand;
import com.guymoyo.domain.UserAccountDataOnDemand;
import com.guymoyo.service.RencontreService;
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

privileged aspect RencontreDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RencontreDataOnDemand: @Component;
    
    private Random RencontreDataOnDemand.rnd = new SecureRandom();
    
    private List<Rencontre> RencontreDataOnDemand.data;
    
    @Autowired
    private UserAccountDataOnDemand RencontreDataOnDemand.userAccountDataOnDemand;
    
    @Autowired
    private EquipDataOnDemand RencontreDataOnDemand.equipDataOnDemand;
    
    @Autowired
    private LeagueDataOnDemand RencontreDataOnDemand.leagueDataOnDemand;
    
    @Autowired
    private SportTypeDataOnDemand RencontreDataOnDemand.sportTypeDataOnDemand;
    
    @Autowired
    RencontreService RencontreDataOnDemand.rencontreService;
    
    public Rencontre RencontreDataOnDemand.getNewTransientRencontre(int index) {
        Rencontre obj = new Rencontre();
        setCreationDate(obj, index);
        setLieu(obj, index);
        setRencontreDate(obj, index);
        return obj;
    }
    
    public void RencontreDataOnDemand.setCreationDate(Rencontre obj, int index) {
        Date creationDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreationDate(creationDate);
    }
    
    public void RencontreDataOnDemand.setLieu(Rencontre obj, int index) {
        String lieu = "lieu_" + index;
        obj.setLieu(lieu);
    }
    
    public void RencontreDataOnDemand.setRencontreDate(Rencontre obj, int index) {
        Date rencontreDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setRencontreDate(rencontreDate);
    }
    
    public Rencontre RencontreDataOnDemand.getSpecificRencontre(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Rencontre obj = data.get(index);
        Long id = obj.getId();
        return rencontreService.findRencontre(id);
    }
    
    public Rencontre RencontreDataOnDemand.getRandomRencontre() {
        init();
        Rencontre obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return rencontreService.findRencontre(id);
    }
    
    public boolean RencontreDataOnDemand.modifyRencontre(Rencontre obj) {
        return false;
    }
    
    public void RencontreDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = rencontreService.findRencontreEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Rencontre' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Rencontre>();
        for (int i = 0; i < 10; i++) {
            Rencontre obj = getNewTransientRencontre(i);
            try {
                rencontreService.saveRencontre(obj);
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
