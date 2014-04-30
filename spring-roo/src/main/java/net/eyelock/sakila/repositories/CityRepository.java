package net.eyelock.sakila.repositories;

import net.eyelock.sakila.domain.City;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = City.class)
public interface CityRepository {
}
