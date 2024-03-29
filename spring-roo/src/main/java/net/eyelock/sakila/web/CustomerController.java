package net.eyelock.sakila.web;

import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.RentalService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
    public ResponseEntity<String> listJson() {
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	List<Customer> result = customerService.findAllCustomers();

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.setTotalNoRecords((long) result.size());
	pagination.setSort(customerService.getDefaultSort());
	pagination.configure("" + result.size(), "" + 1);

	return new ResponseEntity<String>(pagination.wrapResponse(Customer
		.toJsonArray(result)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/page/{pageNumber}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson(
	    @PathVariable("pageNumber") String pageNumber,
	    @RequestParam(value = "pageSize", required = false) String pageSize) {

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.setSort(customerService.getDefaultSort());
	pagination.configure(pageSize, pageNumber);

	Page<Customer> page = customerService.findAll(pagination
		.createPageable());

	pagination.setTotalNoRecords(page.getTotalElements());

	return new ResponseEntity<String>(pagination.wrapResponse(Customer
		.toJsonArray(pagination.toCollection(page))), headers,
		HttpStatus.OK);
    }

    @RequestMapping(value = "/{customerId}/rentals", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCustomersJson(
	    @PathVariable("customerId") Short customerId) {
	Customer customer = customerService.findCustomer(customerId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (customer == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	Collection<Rental> collection = rentalService.findByCustomer(customer);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{customerId}/rentals/page/{pageNumber}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCustomersJson(
	    @PathVariable("customerId") Short customerId,
	    @PathVariable("pageNumber") String pageNumber,
	    @RequestParam(value = "pageSize", required = false) String pageSize) {

	Customer customer = customerService.findCustomer(customerId);

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	if (customer == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(pageSize, pageNumber);
	pagination.setSort(rentalService.getDefaultSort());

	Page<Rental> items = rentalService.findByCustomer(customer,
		pagination.createPageable());
	pagination.setTotalNoRecords(items.getTotalElements());

	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(pagination.toCollection(items))), headers,
		HttpStatus.OK);
    }
}
