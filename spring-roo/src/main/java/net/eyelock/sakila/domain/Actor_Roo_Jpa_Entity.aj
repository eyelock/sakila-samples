// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import net.eyelock.sakila.domain.Actor;

privileged aspect Actor_Roo_Jpa_Entity {
    
    declare @type: Actor: @Entity;
    
    declare @type: Actor: @Table(name = "actor");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "actor_id")
    private Short Actor.actorId;
    
    public Short Actor.getActorId() {
        return this.actorId;
    }
    
    public void Actor.setActorId(Short id) {
        this.actorId = id;
    }
    
}
