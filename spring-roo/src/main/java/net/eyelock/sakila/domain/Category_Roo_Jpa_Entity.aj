// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import net.eyelock.sakila.domain.Category;

privileged aspect Category_Roo_Jpa_Entity {
    
    declare @type: Category: @Entity;
    
    declare @type: Category: @Table(name = "category");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "category_id")
    private Short Category.categoryId;
    
    public Short Category.getCategoryId() {
        return this.categoryId;
    }
    
    public void Category.setCategoryId(Short id) {
        this.categoryId = id;
    }
    
}