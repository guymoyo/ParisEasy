// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.guymoyo.domain;

import com.guymoyo.domain.CategoryParis;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CategoryParis_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CategoryParis.entityManager;
    
    public static final EntityManager CategoryParis.entityManager() {
        EntityManager em = new CategoryParis().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CategoryParis.countCategoryParises() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CategoryParis o", Long.class).getSingleResult();
    }
    
    public static List<CategoryParis> CategoryParis.findAllCategoryParises() {
        return entityManager().createQuery("SELECT o FROM CategoryParis o", CategoryParis.class).getResultList();
    }
    
    public static CategoryParis CategoryParis.findCategoryParis(Long id) {
        if (id == null) return null;
        return entityManager().find(CategoryParis.class, id);
    }
    
    public static List<CategoryParis> CategoryParis.findCategoryParisEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CategoryParis o", CategoryParis.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CategoryParis.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CategoryParis.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CategoryParis attached = CategoryParis.findCategoryParis(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CategoryParis.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CategoryParis.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CategoryParis CategoryParis.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CategoryParis merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
