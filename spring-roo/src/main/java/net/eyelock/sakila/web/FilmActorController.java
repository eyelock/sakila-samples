package net.eyelock.sakila.web;
import net.eyelock.sakila.domain.FilmActor;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/filmactors")
@Controller
@RooWebScaffold(path = "filmactors", formBackingObject = FilmActor.class)
@RooWebJson(jsonObject = FilmActor.class)
public class FilmActorController {
}
