package net.eyelock.sakila.services;

import java.util.ArrayList;
import java.util.Collection;

import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmActor;

public class FilmActorServiceImpl implements FilmActorService {
    @Override
    public Collection<Actor> getActors(Film film) {
	Collection<FilmActor> list = filmActorRepository.findByFilmId(film);

	Collection<Actor> collection = new ArrayList<Actor>();
	for (FilmActor filmActor : list) {
	    collection.add(filmActor.getActorId());
	}

	return collection;
    }

    @Override
    public Collection<Film> getFilms(Actor actor) {
	Collection<FilmActor> list = filmActorRepository.findByActorId(actor);

	Collection<Film> collection = new ArrayList<Film>();
	for (FilmActor filmActor : list) {
	    collection.add(filmActor.getFilmId());
	}

	return collection;
    }
}
