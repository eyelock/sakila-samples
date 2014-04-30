package net.eyelock.sakila.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(identifierType = FilmCategoryPK.class, versionField = "", table = "film_category")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "filmId", "categoryId" })
@RooJson
public class FilmCategory {
}
