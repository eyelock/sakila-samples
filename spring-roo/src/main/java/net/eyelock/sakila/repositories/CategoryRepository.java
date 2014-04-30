package net.eyelock.sakila.repositories;

import net.eyelock.sakila.domain.Category;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Category.class)
public interface CategoryRepository {
}
