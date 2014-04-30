package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.Address;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/addresses")
@Controller
@RooWebScaffold(path = "addresses", formBackingObject = Address.class)
@RooWebJson(jsonObject = Address.class)
public class AddressController {
}
