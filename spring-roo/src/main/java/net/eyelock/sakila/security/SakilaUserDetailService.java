package net.eyelock.sakila.security;

import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.services.CustomerService;
import net.eyelock.sakila.services.StaffService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class SakilaUserDetailService implements UserDetailsService {
    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StaffService staffService;

    @Autowired
    private CustomerService customerService;

    @Override
    public UserDetails loadUserByUsername(String username)
	    throws UsernameNotFoundException {

	Staff staff = staffService.findByUsername(username);

	if (staff != null) {
	    logger.debug("found staff with username={}", username);
	    return staff;
	}

	Customer customer = customerService.findByEmail(username);

	if (customer != null) {
	    logger.debug("found customer with username={}", username);
	    return customer;
	}

	logger.debug(
		"did not find either customer or staff with username or email address={}",
		username);

	// TODO localise this string
	throw new UsernameNotFoundException("Username not found: '" + username
		+ "'");
    }

}
