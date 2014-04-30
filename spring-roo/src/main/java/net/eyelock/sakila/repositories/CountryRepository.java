package net.eyelock.sakila.repositories;
import net.eyelock.sakila.domain.Country;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Country.class)
public interface CountryRepository {
}
