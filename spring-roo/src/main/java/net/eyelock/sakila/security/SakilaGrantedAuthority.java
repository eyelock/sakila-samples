package net.eyelock.sakila.security;

import org.springframework.security.core.GrantedAuthority;

public enum SakilaGrantedAuthority implements GrantedAuthority {

	CUSTOMER("CUSTOMER"), STAFF("STAFF");
	
	private String id;
	
	private SakilaGrantedAuthority(String id) {
		this.id = id;
	}
	
	public String getAuthority() {
		return id;
	}
	
	@Override
	public String toString() {
		return id;
	}
}
