// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import net.eyelock.sakila.domain.Film;

privileged aspect Film_Roo_Jpa_Entity {
    
    declare @type: Film: @Entity;
    
    declare @type: Film: @Table(name = "film");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "film_id")
    private Short Film.filmId;
    
    public Short Film.getFilmId() {
        return this.filmId;
    }
    
    public void Film.setFilmId(Short id) {
        this.filmId = id;
    }
    
}
