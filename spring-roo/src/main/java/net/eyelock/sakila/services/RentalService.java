package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.domain.Store;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Rental.class })
public interface RentalService {
    Collection<Rental> findByStore(Store store);

    Page<Rental> findByStore(Store store, Pageable pageable);

    Collection<Rental> findByCustomer(Customer customer);

    Page<Rental> findByCustomer(Customer customer, Pageable pageable);

    Collection<Rental> findByStaff(Staff staff);

    Page<Rental> findByStaff(Staff staff, Pageable pageable);

    Collection<Rental> findByInventory(Inventory inventory);

    Page<Rental> findByInventory(Inventory inventory, Pageable pageable);

    Collection<Rental> findByFilm(Film film);

    Sort getDefaultSort();

    Page<Rental> findRentals(Pageable pageable);
}
