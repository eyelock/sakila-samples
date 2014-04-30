package net.eyelock.sakila.domain;
import java.util.Calendar;
import java.util.Collection;
import net.eyelock.sakila.helpers.FlexJsonDateTransformer;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import flexjson.JSONSerializer;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "store")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "customers", "inventories", "staffs", "managerStaffId", "addressId" })
@RooJson
public class Store {

    public Short getId() {
        return getStoreId();
    }

    public static String toJsonArray(Collection<Store> collection) {
        return new JSONSerializer().transform(new FlexJsonDateTransformer(), Calendar.class).exclude("*.id").serialize(collection);
    }

    public String toJson(String[] fields) {
        return new JSONSerializer().include(fields).transform(new FlexJsonDateTransformer(), Calendar.class).exclude("*.class").serialize(this);
    }

    public String toJson() {
        return new JSONSerializer().transform(new FlexJsonDateTransformer(), Calendar.class).exclude("*.class").serialize(this);
    }
}
