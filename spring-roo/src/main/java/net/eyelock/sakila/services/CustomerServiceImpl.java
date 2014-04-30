package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.repositories.CustomerRepository;

import org.springframework.beans.factory.annotation.Autowired;

public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customer findByEmail(String email) {
	return customerRepository.findByEmail(email);
    }

    @Override
    public Collection<Customer> findByStore(Store store) {
	return customerRepository.findByStoreId(store);
    }
}
