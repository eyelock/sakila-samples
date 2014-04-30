// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Calendar;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.FilmCategory;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Category_Roo_DbManaged {
    
    @OneToMany(mappedBy = "categoryId", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private Set<FilmCategory> Category.filmCategories;
    
    @Column(name = "name", length = 25)
    @NotNull
    private String Category.name;
    
    @Column(name = "last_update")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Category.lastUpdate;
    
    public Set<FilmCategory> Category.getFilmCategories() {
        return filmCategories;
    }
    
    public void Category.setFilmCategories(Set<FilmCategory> filmCategories) {
        this.filmCategories = filmCategories;
    }
    
    public String Category.getName() {
        return name;
    }
    
    public void Category.setName(String name) {
        this.name = name;
    }
    
    public Calendar Category.getLastUpdate() {
        return lastUpdate;
    }
    
    public void Category.setLastUpdate(Calendar lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
}