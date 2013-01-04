// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.SportType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SportType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager SportType.entityManager;
    
    public static final EntityManager SportType.entityManager() {
        EntityManager em = new SportType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SportType.countSportTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SportType o", Long.class).getSingleResult();
    }
    
    public static List<SportType> SportType.findAllSportTypes() {
        return entityManager().createQuery("SELECT o FROM SportType o", SportType.class).getResultList();
    }
    
    public static SportType SportType.findSportType(Long id) {
        if (id == null) return null;
        return entityManager().find(SportType.class, id);
    }
    
    public static List<SportType> SportType.findSportTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SportType o", SportType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void SportType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SportType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SportType attached = SportType.findSportType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SportType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SportType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SportType SportType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SportType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
