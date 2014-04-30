package net.eyelock.sakila.web;

import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.CustomerService;
import net.eyelock.sakila.services.FilmService;
import net.eyelock.sakila.services.InventoryService;
import net.eyelock.sakila.services.StoreService;

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

@RequestMapping("/rentals")
@Controller
@RooWebScaffold(path = "rentals", formBackingObject = Rental.class)
@RooWebJson(jsonObject = Rental.class)
public class RentalController {

    @Autowired
    private AppFactory appFactory;

    @Autowired
    private StoreService storeService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private FilmService filmService;

    @Autowired
    private InventoryService inventoryService;

    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson(
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.setTotalNoRecords(rentalService.countAllRentals());
	pagination.configure(pageSize, pageNumber);

	List<Rental> result = rentalService.findRentalEntries(
		pagination.getFirstResult(), pagination.getMaxResults());
	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(result)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/stores/{storeId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showStoresJson(
	    @PathVariable("storeId") Short storeId,
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	Store store = storeService.findStore(storeId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (store == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	// TODO This needs paging/sorting
	Collection<Rental> collection = rentalService.findByStore(store);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/customers/{customerId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCustomersJson(
	    @PathVariable("customerId") Short customerId,
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	Customer customer = customerService.findCustomer(customerId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (customer == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	// TODO This needs paging/sorting
	Collection<Rental> collection = rentalService.findByCustomer(customer);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/films/{filmId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showFilmsJson(
	    @PathVariable("filmId") Short filmId,
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	Film film = filmService.findFilm(filmId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (film == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	// TODO This needs paging/sorting
	Collection<Rental> collection = rentalService.findByFilm(film);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/inventories/{inventoryId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showInventoriesJson(
	    @PathVariable("inventoryId") Short inventoryId,
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	Inventory inventory = inventoryService.findInventory(inventoryId
		.intValue());
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (inventory == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	// TODO This needs paging/sorting
	Collection<Rental> collection = rentalService
		.findByInventory(inventory);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Rental
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }
}