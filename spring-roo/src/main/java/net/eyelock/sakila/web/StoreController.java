package net.eyelock.sakila.web;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.CustomerService;
import net.eyelock.sakila.services.InventoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/stores")
@Controller
@RooWebScaffold(path = "stores", formBackingObject = Store.class)
@RooWebJson(jsonObject = Store.class)
public class StoreController {
	
	@Autowired
	private AppFactory appFactory;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private InventoryService inventoryService;

	@RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson(@RequestParam(value="pageSize", required=false) String pageSize, @RequestParam(value="pageNumber", required=false) String pageNumber) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        
        WebPaginationHelper pagination = appFactory.createPaginationHelper();
        pagination.setTotalNoRecords(storeService.countAllStores());
        pagination.configure(pageSize, pageNumber);
        
        List<Store> result = storeService.findStoreEntries(pagination.getFirstResult(), pagination.getMaxResults());
        return new ResponseEntity<String>(pagination.wrapResponse(Store.toJsonArray(result)), headers, HttpStatus.OK);
    }
	
    @RequestMapping(value = "/{storeId}/customers", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCustomersJson(@PathVariable("storeId") Short storeId) {
        Store store = storeService.findStore(storeId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (store == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        
        Collection<Customer> collection = customerService.findByStore(store);
        
        WebPaginationHelper pagination = appFactory.createPaginationHelper();
        pagination.configure(collection);

        return new ResponseEntity<String>(pagination.wrapResponse(Customer.toJsonArray(collection)), headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{storeId}/films", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showFilmsJson(@PathVariable("storeId") Short storeId) {
        Store store = storeService.findStore(storeId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (store == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        
        Collection<Film> collection = inventoryService.getFilms(store);
        
        //Make unique films only
        Set<Film> unique = new HashSet<Film>(collection);
        
        WebPaginationHelper pagination = appFactory.createPaginationHelper();
        pagination.configure(unique);

        return new ResponseEntity<String>(pagination.wrapResponse(Film.toJsonArray(unique)), headers, HttpStatus.OK);
    }
}
