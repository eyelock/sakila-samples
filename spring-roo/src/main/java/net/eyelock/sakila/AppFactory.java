package net.eyelock.sakila;

import net.eyelock.sakila.helpers.WebPaginationHelper;

import org.springframework.beans.factory.annotation.Autowired;
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
}
