package net.eyelock.sakila.repositories;

import net.eyelock.sakila.domain.Film;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Film.class)
public interface FilmRepository {
}
