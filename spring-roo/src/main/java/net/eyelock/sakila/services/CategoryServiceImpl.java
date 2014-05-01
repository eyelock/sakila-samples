package net.eyelock.sakila.services;

import org.springframework.data.domain.Sort;

public class CategoryServiceImpl implements CategoryService {
    @Override
    public Sort getDefaultSort() {
	return new Sort(new Sort.Order(Sort.Direction.ASC, "name"));
    }
}
