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

    Collection<Rental> findByCustomer(Customer customer);

    Collection<Rental> findByStaff(Staff staff);

    Collection<Rental> findByInventory(Inventory inventory);

    Collection<Rental> findByFilm(Film film);

    Sort getDefaultSort();

    Page<Rental> findRentals(Pageable createPageable);
}
