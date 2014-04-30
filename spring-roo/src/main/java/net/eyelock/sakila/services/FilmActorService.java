package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;

import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.FilmActor.class })
public interface FilmActorService {

    Collection<Actor> getActors(Film film);

    Collection<Film> getFilms(Actor actor);
}
