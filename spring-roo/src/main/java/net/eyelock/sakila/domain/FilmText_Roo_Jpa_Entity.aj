// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import net.eyelock.sakila.domain.FilmText;

privileged aspect FilmText_Roo_Jpa_Entity {
    
    declare @type: FilmText: @Entity;
    
    declare @type: FilmText: @Table(name = "film_text");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "film_id")
    private Short FilmText.filmId;
    
    public Short FilmText.getFilmId() {
        return this.filmId;
    }
    
    public void FilmText.setFilmId(Short id) {
        this.filmId = id;
    }
    
}
