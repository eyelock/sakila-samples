package net.eyelock.sakila.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(identifierType = FilmActorPK.class, versionField = "", table = "film_actor")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "actorId", "filmId" })
@RooJson
public class FilmActor {
}
