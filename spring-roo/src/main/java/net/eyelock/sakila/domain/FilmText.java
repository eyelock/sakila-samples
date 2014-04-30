package net.eyelock.sakila.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(versionField = "", table = "film_text")
@RooDbManaged(automaticallyDelete = true)
@RooJson
public class FilmText {

    public Short getId() {
	return getFilmId();
    }
}
