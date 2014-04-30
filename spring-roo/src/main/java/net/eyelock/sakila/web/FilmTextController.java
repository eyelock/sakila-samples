package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.FilmText;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/filmtexts")
@Controller
@RooWebScaffold(path = "filmtexts", formBackingObject = FilmText.class)
@RooWebJson(jsonObject = FilmText.class)
public class FilmTextController {
}
