package net.eyelock.sakila.web;
import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.RentalService;

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

@RequestMapping("/customers")
@Controller
@RooWebScaffold(path = "customers", formBackingObject = Customer.class)
@RooWebJson(jsonObject = Customer.class)
public class CustomerController {
	
	@Autowired
	private AppFactory appFactory;
	
	@Autowired
	private RentalService rentalService;

	@RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson(@RequestParam(value="pageSize", required=false) String pageSize, @RequestParam(value="pageNumber", required=false) String pageNumber) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        
        WebPaginationHelper pagination = appFactory.createPaginationHelper();
        pagination.setTotalNoRecords(rentalService.countAllRentals());
        pagination.configure(pageSize, pageNumber);        
        
        List<Customer> result = customerService.findCustomerEntries(pagination.getFirstResult(), pagination.getMaxResults());
        return new ResponseEntity<String>(pagination.wrapResponse(Customer.toJsonArray(result)), headers, HttpStatus.OK);
    }
	
    @RequestMapping(value = "/{customerId}/rentals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showRentalsJson(@PathVariable("customerId") Short customerId, @RequestParam(value="pageSize", required=false) String pageSize, @RequestParam(value="pageNumber", required=false) String pageNumber) {
        Customer customer = customerService.findCustomer(customerId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (customer == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        
        //TODO This needs paging/sorting
        Collection<Rental> collection = rentalService.findByCustomer(customer);
        
        WebPaginationHelper pagination = appFactory.createPaginationHelper();
        pagination.configure(collection);

        return new ResponseEntity<String>(pagination.wrapResponse(Rental.toJsonArray(collection)), headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/stores/{storeId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showStoresJson(@PathVariable("storeId") Short storeId, @RequestParam(value="pageSize", required=false) String pageSize, @RequestParam(value="pageNumber", required=false) String pageNumber) {
        Store store = storeService.findStore(storeId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (store == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        
        //TODO This needs paging/sorting
        Collection<Customer> collection = customerService.findByStore(store);
        
        WebPaginationHelper pagination = appFactory.createPaginationHelper();
        pagination.configure(collection);

        return new ResponseEntity<String>(pagination.wrapResponse(Customer.toJsonArray(collection)), headers, HttpStatus.OK);
    }
}
