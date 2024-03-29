package net.eyelock.sakila.web;

import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.FilmCategoryService;

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

@RequestMapping("/categories")
@Controller
@RooWebScaffold(path = "categories", formBackingObject = Category.class)
@RooWebJson(jsonObject = Category.class)
public class CategoryController {

    @Autowired
    private AppFactory appFactory;

    @Autowired
    private FilmCategoryService filmCategoryService;

    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson() {

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	List<Category> result = categoryService.findAllCategorys();

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.setSort(categoryService.getDefaultSort());
	pagination.setTotalNoRecords((long) result.size());
	pagination.configure("" + result.size(), "" + 1);

	return new ResponseEntity<String>(pagination.wrapResponse(Category
		.toJsonArray(result)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{categoryId}/films", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showFilmsJson(
	    @PathVariable("categoryId") Short categoryId) {

	Category category = categoryService.findCategory(categoryId);

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	if (category == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	Collection<Film> collection = filmCategoryService.getFilms(category);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Film
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{categoryId}/films/page/{pageNumber}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showFilmsJson(
	    @PathVariable("categoryId") Short categoryId,
	    @PathVariable("pageNumber") String pageNumber,
	    @RequestParam(value = "pageSize", required = false) String pageSize) {

	Category category = categoryService.findCategory(categoryId);

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	if (category == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(pageSize, pageNumber);

	Page<Film> page = filmCategoryService.getFilms(category,
		pagination.createPageable());

	pagination.setTotalNoRecords(page.getTotalElements());

	return new ResponseEntity<String>(pagination.wrapResponse(Film
		.toJsonArray(pagination.toCollection(page))), headers,
		HttpStatus.OK);
    }
}
