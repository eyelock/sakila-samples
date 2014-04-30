package net.eyelock.sakila.helpers;

import java.util.Collection;

import net.eyelock.sakila.AppConfig;

public class WebPaginationHelper {
	private Integer pageSize;
	
	private Integer pageNumber;
	
	private boolean converted;
	
	private Long totalNoRecords;
	
	private AppConfig appConfig;

	public WebPaginationHelper() {
		converted = false;
	}
	
	public AppConfig getAppConfig() {
		return appConfig;
	}

	public void setAppConfig(AppConfig appConfig) {
		this.appConfig = appConfig;
	}
	
	public void configure(@SuppressWarnings("rawtypes") Collection collection) {
		setTotalNoRecords(new Long(collection.size()));
		setPageNumber(1);
		setPageSize(collection.size());
	}
	
	public void configure(String pageSize, String pageNumber) {
		Integer iPageSize = null;
		Integer iPageNumber = null;
		
		try {
			iPageSize = Integer.parseInt(pageSize);
			iPageNumber = Integer.parseInt(pageNumber);
			converted = true;
		} catch(NumberFormatException e) {
			converted = false;
		}
		
		if (converted) {
			setPageNumber(iPageNumber);
			setPageSize(iPageSize);
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
	
	public String wrapResponse(String response) {
		StringBuffer wrappedResponse = new StringBuffer();
		wrappedResponse.append("{");
		wrappedResponse.append("\"pageSize\":" + getPageSize() + ",");
		wrappedResponse.append("\"pageNumber\":" + getPageNumber() + ",");
		wrappedResponse.append("\"totalCount\":" + getTotalNoRecords() + ",");
		wrappedResponse.append("\"" + appConfig.getCollectionName() + "\": " + response + "");
		wrappedResponse.append("}");
		
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
}
