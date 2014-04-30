package net.eyelock.sakila.services;

import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.repositories.StaffRepository;

import org.springframework.beans.factory.annotation.Autowired;

public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffRepository staffRepository;

    @Override
    public Staff findByUsername(String username) {
	Staff found = staffRepository.findByUsername(username);
	return found;
    }
}
