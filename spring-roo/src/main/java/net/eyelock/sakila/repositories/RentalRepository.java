package net.eyelock.sakila.repositories;
import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Rental.class)
public interface RentalRepository {
	Collection<Rental> findByCustomerId(Customer customer);
	Collection<Rental> findByStaffId(Staff staff);
	Collection<Rental> findByInventoryId(Inventory inventory);
}
