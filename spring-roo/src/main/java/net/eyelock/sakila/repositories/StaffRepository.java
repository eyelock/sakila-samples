package net.eyelock.sakila.repositories;
import net.eyelock.sakila.domain.Staff;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Staff.class)
public interface StaffRepository {
	Staff findByUsername(String username);
}
