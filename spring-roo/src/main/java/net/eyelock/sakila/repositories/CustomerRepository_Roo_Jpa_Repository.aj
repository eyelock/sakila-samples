// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.repositories;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.repositories.CustomerRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect CustomerRepository_Roo_Jpa_Repository {
    
    declare parents: CustomerRepository extends JpaRepository<Customer, Short>;
    
    declare parents: CustomerRepository extends JpaSpecificationExecutor<Customer>;
    
    declare @type: CustomerRepository: @Repository;
    
}
