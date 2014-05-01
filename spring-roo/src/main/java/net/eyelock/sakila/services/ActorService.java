package net.eyelock.sakila.services;

import net.eyelock.sakila.domain.Actor;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Actor.class })
public interface ActorService {
    Page<Actor> findAll(Pageable pageable);

    Sort getDefaultSort();
}
