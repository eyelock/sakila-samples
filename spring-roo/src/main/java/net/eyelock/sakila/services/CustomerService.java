package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Store;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Customer.class })
public interface CustomerService {
    Customer findByEmail(String email);

    Collection<Customer> findByStore(Store store);

    Page<Customer> findByStore(Store store, Pageable pageable);

    Page<Customer> findAll(Pageable createPageable);

    Sort getDefaultSort();
}
