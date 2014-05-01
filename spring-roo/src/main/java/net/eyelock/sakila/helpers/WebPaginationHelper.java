package net.eyelock.sakila.helpers;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import net.eyelock.sakila.AppConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class WebPaginationHelper {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private Integer pageSize;

    private Integer pageNumber;

    private boolean converted;

    private Long totalNoRecords;

    private AppConfig appConfig;

    private Sort sort;

    public WebPaginationHelper() {
	converted = false;
    }

    public AppConfig getAppConfig() {
	return appConfig;
    }

    public boolean isValid() {
	return pageSize != null && pageNumber != null;
    }

    public void setAppConfig(AppConfig appConfig) {
	this.appConfig = appConfig;
    }

    public void configure(@SuppressWarnings("rawtypes") Collection collection) {
	setTotalNoRecords(new Long(collection.size()));
	setPageNumber(1);
	setPageSize(collection.size());
	converted = true;
    }

    public void configure(String pageSize, String pageNumber) {
	Integer iPageSize = null;
	Integer iPageNumber = null;

	try {
	    iPageNumber = Integer.parseInt(pageNumber);
	    setPageNumber(iPageNumber);
	} catch (NumberFormatException e) {
	    converted = false;
	}

	try {
	    iPageSize = Integer.parseInt(pageSize);
	    setPageSize(iPageSize);

	} catch (NumberFormatException e) {
	    setPageSize(appConfig.getDefaultPageSize());
	}
    }

    public Integer getFirstResult() {
	if (!converted) {
	    return 1;
	}

	if (getPageNumber() == 1) {
	    return 1;
	} else {
	    return ((getPageNumber() - 1) * getPageSize()) + 1;
	}
    }

    public Integer getMaxResults() {
	if (!converted) {
	    return getAppConfig().getDefaultPageSize();
	}

	return getPageSize();
    }

    public Integer getPageCount() {
	return (int) Math.ceil(getTotalNoRecords() / getPageSize());
    }

    public String wrapResponse(String response) {

	StringBuffer wrappedResponse = new StringBuffer();

	try {
	    wrappedResponse.append("{");
	    wrappedResponse.append("\"pageSize\":" + getPageSize() + ",");
	    wrappedResponse.append("\"pageNumber\":" + getPageNumber() + ",");
	    wrappedResponse.append("\"pageCount\":" + getPageCount() + ",");
	    wrappedResponse.append("\"totalCount\":" + getTotalNoRecords()
		    + ",");
	    wrappedResponse.append("\"" + appConfig.getCollectionName()
		    + "\": " + response + "");
	    wrappedResponse.append("}");
	} catch (Exception e) {
	    logger.error("problem building wrapped response: {}",
		    e.getMessage());
	}

	return wrappedResponse.toString();
    }

    public Integer getPageNumber() {
	if (pageNumber == null)
	    return 1;

	return pageNumber;
    }

    private void setPageNumber(Integer pageNumber) {
	this.pageNumber = pageNumber;
    }

    public Integer getPageSize() {
	if (pageSize == null)
	    return appConfig.getDefaultPageSize();

	return pageSize;
    }

    private void setPageSize(Integer pageSize) {
	this.pageSize = pageSize;
    }

    public Long getTotalNoRecords() {
	return totalNoRecords;
    }

    public void setTotalNoRecords(Long totalNoRecords) {
	this.totalNoRecords = totalNoRecords;
    }

    public Pageable createPageable() {
	PageRequest pageRequest = null;

	if (sort == null) {
	    pageRequest = new PageRequest(getPageNumber(), getPageSize());
	} else {
	    pageRequest = new PageRequest(getPageNumber(), getPageSize(),
		    getSort());
	}

	return pageRequest;
    }

    public <T> Collection<T> toCollection(Page<T> page) {
	Collection<T> collection = new ArrayList<T>();
	Iterator<T> iterator = page.iterator();

	while (iterator.hasNext()) {
	    collection.add(iterator.next());
	}

	return collection;
    }

    public Sort getSort() {
	return sort;
    }

    public void setSort(Sort sort) {
	this.sort = sort;
    }
}
