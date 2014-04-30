// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.services;

import java.util.List;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.services.CustomerService;

privileged aspect CustomerService_Roo_Service {
    
    public abstract long CustomerService.countAllCustomers();    
    public abstract void CustomerService.deleteCustomer(Customer customer);    
    public abstract Customer CustomerService.findCustomer(Short id);    
    public abstract List<Customer> CustomerService.findAllCustomers();    
    public abstract List<Customer> CustomerService.findCustomerEntries(int firstResult, int maxResults);    
    public abstract void CustomerService.saveCustomer(Customer customer);    
    public abstract Customer CustomerService.updateCustomer(Customer customer);    
}