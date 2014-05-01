package net.eyelock.sakila.services;

import net.eyelock.sakila.domain.Film;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Film.class })
public interface FilmService {
    Page<Film> findAll(Pageable pageable);

    Sort getDefaultSort();
}
