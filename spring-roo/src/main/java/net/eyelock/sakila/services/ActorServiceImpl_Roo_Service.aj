// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.services;

import java.util.List;
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.services.ActorServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ActorServiceImpl_Roo_Service {
    
    declare @type: ActorServiceImpl: @Service;
    
    declare @type: ActorServiceImpl: @Transactional;
    
    public long ActorServiceImpl.countAllActors() {
        return actorRepository.count();
    }
    
    public void ActorServiceImpl.deleteActor(Actor actor) {
        actorRepository.delete(actor);
    }
    
    public Actor ActorServiceImpl.findActor(Short id) {
        return actorRepository.findOne(id);
    }
    
    public List<Actor> ActorServiceImpl.findAllActors() {
        return actorRepository.findAll();
    }
    
    public List<Actor> ActorServiceImpl.findActorEntries(int firstResult, int maxResults) {
        return actorRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ActorServiceImpl.saveActor(Actor actor) {
        actorRepository.save(actor);
    }
    
    public Actor ActorServiceImpl.updateActor(Actor actor) {
        return actorRepository.save(actor);
    }
    
}
