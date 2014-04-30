package net.eyelock.sakila.services;
import net.eyelock.sakila.domain.Staff;

import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Staff.class })
public interface StaffService {
	Staff findByUsername(String username);
}
