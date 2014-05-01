package net.eyelock.sakila.repositories;

import java.util.List;

import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmActor;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FilmActor.class)
public interface FilmActorRepository {
    List<FilmActor> findByFilmId(Film film);

    List<FilmActor> findByActorId(Actor actor);

    Page<FilmActor> findByActorId(Actor actor, Pageable pageable);
}
