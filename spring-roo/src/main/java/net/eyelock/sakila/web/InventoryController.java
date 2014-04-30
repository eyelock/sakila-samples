package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.Inventory;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/inventories")
@Controller
@RooWebScaffold(path = "inventories", formBackingObject = Inventory.class)
@RooWebJson(jsonObject = Inventory.class)
public class InventoryController {
}
