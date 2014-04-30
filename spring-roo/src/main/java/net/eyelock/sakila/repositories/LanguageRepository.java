package net.eyelock.sakila.repositories;
import net.eyelock.sakila.domain.Language;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Language.class)
public interface LanguageRepository {
}
