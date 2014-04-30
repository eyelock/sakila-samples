package net.eyelock.sakila.web;
import net.eyelock.sakila.domain.City;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/cities")
@Controller
@RooWebScaffold(path = "cities", formBackingObject = City.class)
@RooWebJson(jsonObject = City.class)
public class CityController {
}
