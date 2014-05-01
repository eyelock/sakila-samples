package net.eyelock.sakila.services;

import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.repositories.FilmRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public class FilmServiceImpl implements FilmService {
    @Autowired
    private FilmRepository filmRepository;

    @Override
    public Page<Film> findAll(Pageable pageable) {
	return filmRepository.findAll(pageable);
    }
}
