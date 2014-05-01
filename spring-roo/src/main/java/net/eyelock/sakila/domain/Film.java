package net.eyelock.sakila.domain;
import java.util.Calendar;
import java.util.Collection;
import java.util.Set;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import net.eyelock.sakila.helpers.FlexJsonDateTransformer;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;
import flexjson.JSONSerializer;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "film")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "filmActors", "filmCategories", "inventories", "languageId", "originalLanguageId", "lastUpdate" })
@RooJson
public class Film {

    @OneToMany(mappedBy = "filmId", fetch = FetchType.LAZY, cascade = { javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.MERGE })
    private Set<FilmCategory> filmCategories;

    @OneToMany(mappedBy = "filmId", fetch = FetchType.LAZY, cascade = { javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.MERGE })
    private Set<FilmActor> filmActors;

    @OneToMany(mappedBy = "filmId", fetch = FetchType.LAZY, cascade = { javax.persistence.CascadeType.PERSIST, javax.persistence.CascadeType.MERGE })
    private Set<Inventory> inventories;

    public Short getId() {
        return getFilmId();
    }

    public static String toJsonArray(Collection<Film> collection) {
        return new JSONSerializer().transform(new FlexJsonDateTransformer(), Calendar.class).exclude("*.id").serialize(collection);
    }

    public String toJson(String[] fields) {
        return new JSONSerializer().include(fields).transform(new FlexJsonDateTransformer(), Calendar.class).exclude("*.class").serialize(this);
    }

    public String toJson() {
        return new JSONSerializer().transform(new FlexJsonDateTransformer(), Calendar.class).exclude("*.class").serialize(this);
    }
}
