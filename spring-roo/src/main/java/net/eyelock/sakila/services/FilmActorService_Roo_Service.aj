// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.services;

import java.util.List;
import net.eyelock.sakila.domain.FilmActor;
import net.eyelock.sakila.domain.FilmActorPK;
import net.eyelock.sakila.services.FilmActorService;

privileged aspect FilmActorService_Roo_Service {
    
    public abstract long FilmActorService.countAllFilmActors();    
    public abstract void FilmActorService.deleteFilmActor(FilmActor filmActor);    
    public abstract FilmActor FilmActorService.findFilmActor(FilmActorPK id);    
    public abstract List<FilmActor> FilmActorService.findAllFilmActors();    
    public abstract List<FilmActor> FilmActorService.findFilmActorEntries(int firstResult, int maxResults);    
    public abstract void FilmActorService.saveFilmActor(FilmActor filmActor);    
    public abstract FilmActor FilmActorService.updateFilmActor(FilmActor filmActor);    
}
