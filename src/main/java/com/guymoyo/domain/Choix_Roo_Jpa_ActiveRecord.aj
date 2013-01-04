// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Choix;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Choix_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Choix.entityManager;
    
    public static final EntityManager Choix.entityManager() {
        EntityManager em = new Choix().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Choix.countChoixes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Choix o", Long.class).getSingleResult();
    }
    
    public static List<Choix> Choix.findAllChoixes() {
        return entityManager().createQuery("SELECT o FROM Choix o", Choix.class).getResultList();
    }
    
    public static Choix Choix.findChoix(Long id) {
        if (id == null) return null;
        return entityManager().find(Choix.class, id);
    }
    
    public static List<Choix> Choix.findChoixEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Choix o", Choix.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Choix.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Choix.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Choix attached = Choix.findChoix(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Choix.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Choix.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Choix Choix.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Choix merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
