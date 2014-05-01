package net.eyelock.sakila.web;

import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.FilmActorService;
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

@RequestMapping("/films")
@Controller
@RooWebScaffold(path = "films", formBackingObject = Film.class)
@RooWebJson(jsonObject = Film.class)
public class FilmController {
    @Autowired
    private AppFactory appFactory;

    @Autowired
    private FilmCategoryService filmCategoryService;

    @Autowired
    private FilmActorService filmActorService;

    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson(
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.setSort(filmService.getDefaultSort());
	pagination.setTotalNoRecords(filmService.countAllFilms());
	pagination.configure(pageSize, pageNumber);

	List<Film> results = filmService.findAllFilms();

	return new ResponseEntity<String>(pagination.wrapResponse(Film
		.toJsonArray(results)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/page/{pageNumber}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listPagedJson(
	    @PathVariable(value = "pageNumber") String pageNumber,
	    @RequestParam(value = "pageSize", required = false) String pageSize) {
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.setSort(filmService.getDefaultSort());
	pagination.configure(pageSize, pageNumber);

	Page<Film> page = filmService.findAll(pagination.createPageable());
	pagination.setTotalNoRecords(page.getTotalElements());

	return new ResponseEntity<String>(pagination.wrapResponse(Film
		.toJsonArray(pagination.toCollection(page))), headers,
		HttpStatus.OK);
    }

    @RequestMapping(value = "/{filmId}/categories", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCategoriesJson(
	    @PathVariable("filmId") Short filmId) {
	Film film = filmService.findFilm(filmId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (film == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	Collection<Category> collection = filmCategoryService
		.getCategories(film);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Category
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{filmId}/actors", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showActorsJson(
	    @PathVariable("filmId") Short filmId) {
	Film film = filmService.findFilm(filmId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (film == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	Collection<Actor> collection = filmActorService.getActors(film);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Actor
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{filmId}/inventories", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showInventoriesJson(
	    @PathVariable("filmId") Short filmId) {
	Film film = filmService.findFilm(filmId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (film == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	// TODO

	return new ResponseEntity<String>(film.toJson(), headers, HttpStatus.OK);
    }
}
