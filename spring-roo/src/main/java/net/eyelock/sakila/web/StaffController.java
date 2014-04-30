package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.Staff;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/staff")
@Controller
@RooWebScaffold(path = "staff", formBackingObject = Staff.class)
@RooWebJson(jsonObject = Staff.class)
public class StaffController {
}
