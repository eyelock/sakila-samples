// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmActor;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect FilmActor_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "actor_id", referencedColumnName = "actor_id", nullable = false, insertable = false, updatable = false)
    private Actor FilmActor.actorId;
    
    @ManyToOne
    @JoinColumn(name = "film_id", referencedColumnName = "film_id", nullable = false, insertable = false, updatable = false)
    private Film FilmActor.filmId;
    
    @Column(name = "last_update")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar FilmActor.lastUpdate;
    
    public Actor FilmActor.getActorId() {
        return actorId;
    }
    
    public void FilmActor.setActorId(Actor actorId) {
        this.actorId = actorId;
    }
    
    public Film FilmActor.getFilmId() {
        return filmId;
    }
    
    public void FilmActor.setFilmId(Film filmId) {
        this.filmId = filmId;
    }
    
    public Calendar FilmActor.getLastUpdate() {
        return lastUpdate;
    }
    
    public void FilmActor.setLastUpdate(Calendar lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
}