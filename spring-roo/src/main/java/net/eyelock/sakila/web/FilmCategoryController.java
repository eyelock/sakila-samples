package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.FilmCategory;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/filmcategories")
@Controller
@RooWebScaffold(path = "filmcategories", formBackingObject = FilmCategory.class)
@RooWebJson(jsonObject = FilmCategory.class)
public class FilmCategoryController {
}
