// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.services.FilmService;
import net.eyelock.sakila.services.InventoryService;
import net.eyelock.sakila.services.RentalService;
import net.eyelock.sakila.services.StoreService;
import net.eyelock.sakila.web.InventoryController;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect InventoryController_Roo_Controller {
    
    @Autowired
    InventoryService InventoryController.inventoryService;
    
    @Autowired
    FilmService InventoryController.filmService;
    
    @Autowired
    RentalService InventoryController.rentalService;
    
    @Autowired
    StoreService InventoryController.storeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String InventoryController.create(@Valid Inventory inventory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inventory);
            return "inventories/create";
        }
        uiModel.asMap().clear();
        inventoryService.saveInventory(inventory);
        return "redirect:/inventories/" + encodeUrlPathSegment(inventory.getInventoryId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InventoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Inventory());
        return "inventories/create";
    }
    
    @RequestMapping(value = "/{inventoryId}", produces = "text/html")
    public String InventoryController.show(@PathVariable("inventoryId") Integer inventoryId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inventory", inventoryService.findInventory(inventoryId));
        uiModel.addAttribute("itemId", inventoryId);
        return "inventories/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InventoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inventorys", inventoryService.findInventoryEntries(firstResult, sizeNo));
            float nrOfPages = (float) inventoryService.countAllInventorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inventorys", inventoryService.findAllInventorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "inventories/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String InventoryController.update(@Valid Inventory inventory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inventory);
            return "inventories/update";
        }
        uiModel.asMap().clear();
        inventoryService.updateInventory(inventory);
        return "redirect:/inventories/" + encodeUrlPathSegment(inventory.getInventoryId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{inventoryId}", params = "form", produces = "text/html")
    public String InventoryController.updateForm(@PathVariable("inventoryId") Integer inventoryId, Model uiModel) {
        populateEditForm(uiModel, inventoryService.findInventory(inventoryId));
        return "inventories/update";
    }
    
    @RequestMapping(value = "/{inventoryId}", method = RequestMethod.DELETE, produces = "text/html")
    public String InventoryController.delete(@PathVariable("inventoryId") Integer inventoryId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Inventory inventory = inventoryService.findInventory(inventoryId);
        inventoryService.deleteInventory(inventory);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/inventories";
    }
    
    void InventoryController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("inventory_lastupdate_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void InventoryController.populateEditForm(Model uiModel, Inventory inventory) {
        uiModel.addAttribute("inventory", inventory);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("films", filmService.findAllFilms());
        uiModel.addAttribute("rentals", rentalService.findAllRentals());
        uiModel.addAttribute("stores", storeService.findAllStores());
    }
    
    String InventoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
