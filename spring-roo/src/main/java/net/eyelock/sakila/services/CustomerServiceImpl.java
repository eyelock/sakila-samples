package net.eyelock.sakila.services;

import java.util.Collection;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.repositories.CustomerRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

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

    @Override
    public Page<Customer> findByStore(Store store, Pageable pageable) {
	return customerRepository.findByStoreId(store, pageable);
    }

    @Override
    public Page<Customer> findAll(Pageable pageable) {
	return customerRepository.findAll(pageable);
    }

    @Override
    public Sort getDefaultSort() {
	return new Sort(new Sort.Order(Sort.Direction.ASC, "lastName"),
		new Sort.Order(Sort.Direction.ASC, "firstName"));
    }
}
