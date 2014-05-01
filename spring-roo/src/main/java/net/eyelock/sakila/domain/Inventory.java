package net.eyelock.sakila.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "inventory")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "rentals", "storeId", "filmId" })
@RooJson
public class Inventory {

    public Integer getId() {
        return getInventoryId();
    }
}
