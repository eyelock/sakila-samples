package net.eyelock.sakila;

import java.util.List;

import net.eyelock.sakila.helpers.WebPaginationHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

@Component
public class AppFactory {

    @Autowired
    private AppConfig appConfig;

    public WebPaginationHelper createPaginationHelper() {
	WebPaginationHelper helper = new WebPaginationHelper();
	helper.setAppConfig(appConfig);
	return helper;
    }

    public <T> Page<T> createPage(List<T> content, Pageable pageable, long total) {
	Page<T> page = new PageImpl<T>(content, pageable, total);
	return page;
    }
}
