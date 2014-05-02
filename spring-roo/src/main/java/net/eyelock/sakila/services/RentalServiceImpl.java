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

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class RentalServiceImpl implements RentalService {
    @Override
    public Collection<Rental> findByStore(Store store) {
	// TODO Need to get the rentals by store
	return new ArrayList<Rental>();
    }

    @Override
    public Page<Rental> findByStore(Store store, Pageable pageable) {
	// TODO Need to get the rentals by store
	return null;
    }

    @Override
    public Collection<Rental> findByCustomer(Customer customer) {
	return rentalRepository.findByCustomerId(customer);
    }

    @Override
    public Page<Rental> findByCustomer(Customer customer, Pageable pageable) {
	return rentalRepository.findByCustomerId(customer, pageable);
    }

    @Override
    public Collection<Rental> findByStaff(Staff staff) {
	return rentalRepository.findByStaffId(staff);
    }

    @Override
    public Page<Rental> findByStaff(Staff staff, Pageable pageable) {
	return rentalRepository.findByStaffId(staff, pageable);
    }

    @Override
    public Collection<Rental> findByInventory(Inventory inventory) {
	return rentalRepository.findByInventoryId(inventory);
    }

    @Override
    public Page<Rental> findByInventory(Inventory inventory, Pageable pageable) {
	return rentalRepository.findByInventoryId(inventory, pageable);
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

    @Override
    public Page<Rental> findRentals(Pageable pageable) {
	return rentalRepository.findAll(pageable);
    }

    @Override
    public Sort getDefaultSort() {
	return new Sort(new Sort.Order(Sort.Direction.DESC, "rentalDate"));
    }
}
