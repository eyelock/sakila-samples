package net.eyelock.sakila.web;
import net.eyelock.sakila.domain.Language;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/languages")
@Controller
@RooWebScaffold(path = "languages", formBackingObject = Language.class)
@RooWebJson(jsonObject = Language.class)
public class LanguageController {
}
