package net.eyelock.sakila.services;

import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.repositories.ActorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public class ActorServiceImpl implements ActorService {
    @Autowired
    private ActorRepository actorRepository;

    @Override
    public Page<Actor> findAll(Pageable pageable) {
	return actorRepository.findAll(pageable);
    }
}
