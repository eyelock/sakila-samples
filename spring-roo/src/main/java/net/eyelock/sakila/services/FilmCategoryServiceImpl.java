package net.eyelock.sakila.services;

import java.util.ArrayList;
import java.util.Collection;

import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmCategory;

public class FilmCategoryServiceImpl implements FilmCategoryService {	
	@Override
	public Collection<Category> getCategories(Film film) {
		Collection<FilmCategory> list = filmCategoryRepository.findByFilmId(film);
		
		Collection<Category> collection = new ArrayList<Category>();
		for (FilmCategory filmCategory : list) {
			collection.add(filmCategory.getCategoryId());
		}
		
		return collection;
	}
	
	@Override
	public Collection<Film> getFilms(Category category) {
		Collection<FilmCategory> list = filmCategoryRepository.findByCategoryId(category);
		
		Collection<Film> collection = new ArrayList<Film>();
		for (FilmCategory filmCategory : list) {
			collection.add(filmCategory.getFilmId());
		}
		
		return collection;
	}
}
