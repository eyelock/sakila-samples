package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Store;

import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Customer.class })
public interface CustomerService {
    Customer findByEmail(String email);

    Collection<Customer> findByStore(Store store);
}
