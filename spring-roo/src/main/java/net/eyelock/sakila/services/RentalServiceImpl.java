package net.eyelock.sakila.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.domain.Store;

public class RentalServiceImpl implements RentalService {
    public Collection<Rental> findByStore(Store store) {
	// TODO Need to get the rentals by store
	return new ArrayList<Rental>();
    }

    @Override
    public Collection<Rental> findByCustomer(Customer customer) {
	return rentalRepository.findByCustomerId(customer);
    }

    @Override
    public Collection<Rental> findByStaff(Staff staff) {
	return rentalRepository.findByStaffId(staff);
    }

    @Override
    public Collection<Rental> findByInventory(Inventory inventory) {
	return rentalRepository.findByInventoryId(inventory);
    }

    @Override
    public Collection<Rental> findByFilm(Film film) {
	Set<Inventory> inventories = film.getInventories();
	Collection<Rental> allRentals = new ArrayList<Rental>();

	for (Inventory inventory : inventories) {
	    Collection<Rental> inventoryRentals = findByInventory(inventory);
	    allRentals.addAll(inventoryRentals);
	}

	// NOTE Might want to sort here

	return allRentals;
    }
}