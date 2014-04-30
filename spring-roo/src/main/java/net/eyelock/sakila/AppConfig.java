package net.eyelock.sakila;

import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {
    public static Integer DEFAULT_PAGE_SIZE = 20;

    public static String DEFAULT_COLLECTION_NAME = "collection";

    private Integer defaultPageSize;

    private String collectionName;

    public AppConfig() {
	setDefaultPageSize(DEFAULT_PAGE_SIZE);
	setCollectionName(DEFAULT_COLLECTION_NAME);
    }

    public Integer getDefaultPageSize() {
	return defaultPageSize;
    }

    public void setDefaultPageSize(Integer defaultPageSize) {
	this.defaultPageSize = defaultPageSize;
    }

    public String getCollectionName() {
	return collectionName;
    }

    public void setCollectionName(String collectionName) {
	this.collectionName = collectionName;
    }
}
