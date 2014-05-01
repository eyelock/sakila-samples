package net.eyelock.sakila.repositories;

import java.util.List;

import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmCategory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = FilmCategory.class)
public interface FilmCategoryRepository {
    List<FilmCategory> findByFilmId(Film film);

    List<FilmCategory> findByCategoryId(Category category);

    Page<FilmCategory> findByCategoryId(Category category, Pageable pageable);
}
