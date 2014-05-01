package net.eyelock.sakila.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmActor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public class FilmActorServiceImpl implements FilmActorService {
    @Autowired
    private AppFactory appFactory;

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

    @Override
    public Page<Film> getFilms(Actor actor, Pageable pageable) {
	Page<FilmActor> page = filmActorRepository.findByActorId(actor,
		pageable);

	List<Film> list = new ArrayList<Film>();
	for (FilmActor filmActor : page.getContent()) {
	    list.add(filmActor.getFilmId());
	}

	return appFactory.createPage(list, pageable, page.getTotalElements());
    }
}
