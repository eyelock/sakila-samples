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
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.FilmActor;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Actor_Roo_DbManaged {
    
    @OneToMany(mappedBy = "actorId", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private Set<FilmActor> Actor.filmActors;
    
    @Column(name = "first_name", length = 45)
    @NotNull
    private String Actor.firstName;
    
    @Column(name = "last_name", length = 45)
    @NotNull
    private String Actor.lastName;
    
    @Column(name = "last_update")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Actor.lastUpdate;
    
    public Set<FilmActor> Actor.getFilmActors() {
        return filmActors;
    }
    
    public void Actor.setFilmActors(Set<FilmActor> filmActors) {
        this.filmActors = filmActors;
    }
    
    public String Actor.getFirstName() {
        return firstName;
    }
    
    public void Actor.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Actor.getLastName() {
        return lastName;
    }
    
    public void Actor.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public Calendar Actor.getLastUpdate() {
        return lastUpdate;
    }
    
    public void Actor.setLastUpdate(Calendar lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
}
