// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import net.eyelock.sakila.domain.FilmCategory;
import net.eyelock.sakila.domain.FilmCategoryPK;

privileged aspect FilmCategory_Roo_Jpa_Entity {
    
    declare @type: FilmCategory: @Entity;
    
    declare @type: FilmCategory: @Table(name = "film_category");
    
    @EmbeddedId
    private FilmCategoryPK FilmCategory.id;
    
    public FilmCategoryPK FilmCategory.getId() {
        return this.id;
    }
    
    public void FilmCategory.setId(FilmCategoryPK id) {
        this.id = id;
    }
    
}