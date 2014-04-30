package net.eyelock.sakila.repositories;
import net.eyelock.sakila.domain.Address;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Address.class)
public interface AddressRepository {
}
