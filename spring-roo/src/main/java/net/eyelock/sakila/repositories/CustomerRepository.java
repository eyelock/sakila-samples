package net.eyelock.sakila.repositories;
import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Store;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Customer.class)
public interface CustomerRepository {
	Customer findByEmail(String email);
	
	Collection<Customer> findByStoreId(Store store);
}
