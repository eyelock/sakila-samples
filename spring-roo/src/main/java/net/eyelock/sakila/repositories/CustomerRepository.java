package net.eyelock.sakila.repositories;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Store;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Customer.class)
public interface CustomerRepository {
    Customer findByEmail(String email);

    long countByEmail(String email);

    Collection<Customer> findByStoreId(Store store);

    Page<Customer> findByStoreId(Store store, Pageable pageable);
}
