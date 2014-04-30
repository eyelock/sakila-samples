package net.eyelock.sakila.repositories;
import java.util.List;

import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmActor;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FilmActor.class)
public interface FilmActorRepository {
	List<FilmActor> findByFilmId(Film film);
	List<FilmActor> findByActorId(Actor actor);
}
