package net.eyelock.sakila.services;

import org.springframework.data.domain.Sort;
import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Category.class })
public interface CategoryService {

    Sort getDefaultSort();
}
