package net.eyelock.sakila.domain;

import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import net.eyelock.sakila.helpers.FlexJsonDateTransformer;
import net.eyelock.sakila.security.SakilaGrantedAuthority;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import flexjson.JSONSerializer;

@SuppressWarnings("serial")
@RooJavaBean
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "payments", "rentals", "addressId", "storeId" })
@RooJson
@RooJpaEntity(versionField = "", table = "customer")
public class Customer implements UserDetails {

    public Short getId() {
	return getCustomerId();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
	return Collections.singleton(SakilaGrantedAuthority.CUSTOMER);
    }

    @Override
    public String getPassword() {
	return getEmail();
    }

    @Override
    public String getUsername() {
	return getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
	return isActive();
    }

    @Override
    public boolean isAccountNonLocked() {
	return isActive();
    }

    @Override
    public boolean isCredentialsNonExpired() {
	return isActive();
    }

    @Override
    public boolean isEnabled() {
	return isActive();
    }

    public static String toJsonArray(Collection<Customer> collection) {
	return new JSONSerializer()
		.transform(new FlexJsonDateTransformer(), Calendar.class)
		.exclude("*.id").serialize(collection);
    }

    public String toJson(String[] fields) {
	return new JSONSerializer().include(fields)
		.transform(new FlexJsonDateTransformer(), Calendar.class)
		.exclude("*.class").serialize(this);
    }

    public String toJson() {
	return new JSONSerializer()
		.transform(new FlexJsonDateTransformer(), Calendar.class)
		.exclude("*.class").serialize(this);
    }
}
