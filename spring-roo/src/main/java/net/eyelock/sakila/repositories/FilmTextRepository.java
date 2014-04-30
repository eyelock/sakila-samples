package net.eyelock.sakila.repositories;

import net.eyelock.sakila.domain.FilmText;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FilmText.class)
public interface FilmTextRepository {
}
