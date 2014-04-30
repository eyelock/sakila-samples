package net.eyelock.sakila.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "city")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "addresses", "countryId" })
@RooJson
public class City {

    public Short getId() {
	return getCityId();
    }
}
