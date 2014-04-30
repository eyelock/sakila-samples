package net.eyelock.sakila.repositories;
import net.eyelock.sakila.domain.Actor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Actor.class)
public interface ActorRepository {
}
