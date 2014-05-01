package net.eyelock.sakila.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "country")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "cities" })
@RooJson
public class Country {

    public Short getId() {
        return getCountryId();
    }
}
