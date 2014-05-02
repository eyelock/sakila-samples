package net.eyelock.sakila.repositories;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Rental.class)
public interface RentalRepository {
    Collection<Rental> findByCustomerId(Customer customer);

    Page<Rental> findByCustomerId(Customer customer, Pageable pageable);

    Collection<Rental> findByStaffId(Staff staff);

    Page<Rental> findByStaffId(Staff staff, Pageable pageable);

    Collection<Rental> findByInventoryId(Inventory inventory);

    Page<Rental> findByInventoryId(Inventory inventory, Pageable pageable);
}
