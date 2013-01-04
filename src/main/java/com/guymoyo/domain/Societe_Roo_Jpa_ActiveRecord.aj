// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.Societe;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Societe_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Societe.entityManager;
    
    public static final EntityManager Societe.entityManager() {
        EntityManager em = new Societe().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Societe.countSocietes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Societe o", Long.class).getSingleResult();
    }
    
    public static List<Societe> Societe.findAllSocietes() {
        return entityManager().createQuery("SELECT o FROM Societe o", Societe.class).getResultList();
    }
    
    public static Societe Societe.findSociete(Long id) {
        if (id == null) return null;
        return entityManager().find(Societe.class, id);
    }
    
    public static List<Societe> Societe.findSocieteEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Societe o", Societe.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Societe.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Societe.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Societe attached = Societe.findSociete(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Societe.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Societe.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Societe Societe.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Societe merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}