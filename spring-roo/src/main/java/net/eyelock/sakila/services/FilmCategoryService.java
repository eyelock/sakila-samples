package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.Film;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.FilmCategory.class })
public interface FilmCategoryService {

    Collection<Category> getCategories(Film film);

    Collection<Film> getFilms(Category category);

    Page<Film> getFilms(Category category, Pageable pageable);
}
