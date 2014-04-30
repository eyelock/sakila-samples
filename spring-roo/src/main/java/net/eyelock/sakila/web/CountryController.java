package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.Country;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/countries")
@Controller
@RooWebScaffold(path = "countries", formBackingObject = Country.class)
@RooWebJson(jsonObject = Country.class)
public class CountryController {
}
