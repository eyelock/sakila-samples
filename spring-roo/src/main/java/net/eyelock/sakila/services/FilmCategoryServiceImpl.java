package net.eyelock.sakila.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmCategory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public class FilmCategoryServiceImpl implements FilmCategoryService {
    @Autowired
    private AppFactory appFactory;

    @Override
    public Collection<Category> getCategories(Film film) {
	Collection<FilmCategory> list = filmCategoryRepository
		.findByFilmId(film);

	Collection<Category> collection = new ArrayList<Category>();
	for (FilmCategory filmCategory : list) {
	    collection.add(filmCategory.getCategoryId());
	}

	return collection;
    }

    @Override
    public Collection<Film> getFilms(Category category) {
	Collection<FilmCategory> list = filmCategoryRepository
		.findByCategoryId(category);

	Collection<Film> collection = new ArrayList<Film>();
	for (FilmCategory filmCategory : list) {
	    collection.add(filmCategory.getFilmId());
	}

	return collection;
    }

    @Override
    public Page<Film> getFilms(Category category, Pageable pageable) {
	Page<FilmCategory> page = filmCategoryRepository.findByCategoryId(
		category, pageable);

	List<Film> list = new ArrayList<Film>();
	for (FilmCategory filmCategory : page.getContent()) {
	    list.add(filmCategory.getFilmId());
	}

	return appFactory.createPage(list, pageable, page.getTotalElements());
    }
}
