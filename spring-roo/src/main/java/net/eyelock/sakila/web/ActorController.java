package net.eyelock.sakila.web;

import java.util.Collection;
import java.util.List;

import net.eyelock.sakila.AppFactory;
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.helpers.WebPaginationHelper;
import net.eyelock.sakila.services.FilmActorService;

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

@RequestMapping("/actors")
@Controller
@RooWebScaffold(path = "actors", formBackingObject = Actor.class)
@RooWebJson(jsonObject = Actor.class)
public class ActorController {

    @Autowired
    private AppFactory appFactory;

    @Autowired
    private FilmActorService filmActorService;

    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listJson(
	    @RequestParam(value = "pageSize", required = false) String pageSize,
	    @RequestParam(value = "pageNumber", required = false) String pageNumber) {
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	List<Actor> result = actorService.findAllActors();

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(result);

	return new ResponseEntity<String>(pagination.wrapResponse(Actor
		.toJsonArray(result)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/page/{pageNumber}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> listPagedJson(
	    @PathVariable(value = "pageNumber") String pageNumber,
	    @RequestParam(value = "pageSize", required = false) String pageSize) {

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	WebPaginationHelper pagination = appFactory.createPaginationHelper();

	pagination.configure(pageSize, pageNumber);

	Page<Actor> page = actorService.findAll(pagination.createPageable());
	pagination.setTotalNoRecords(actorService.countAllActors());

	return new ResponseEntity<String>(pagination.wrapResponse(Actor
		.toJsonArray(pagination.toCollection(page))), headers,
		HttpStatus.OK);
    }

    @RequestMapping(value = "/{actorId}/films", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCategoriesJson(
	    @PathVariable("actorId") Short actorId) {
	Actor actor = actorService.findActor(actorId);
	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");
	if (actor == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	Collection<Film> collection = filmActorService.getFilms(actor);

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(collection);

	return new ResponseEntity<String>(pagination.wrapResponse(Film
		.toJsonArray(collection)), headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{actorId}/films/page/{pageNumber}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> showCategoriesJson(
	    @PathVariable("actorId") Short actorId,
	    @PathVariable("pageNumber") String pageNumber,
	    @RequestParam(value = "pageSize", required = false) String pageSize) {

	Actor actor = actorService.findActor(actorId);

	HttpHeaders headers = new HttpHeaders();
	headers.add("Content-Type", "application/json; charset=utf-8");

	if (actor == null) {
	    return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
	}

	WebPaginationHelper pagination = appFactory.createPaginationHelper();
	pagination.configure(pageSize, pageNumber);

	Page<Film> page = filmActorService.getFilms(actor,
		pagination.createPageable());

	pagination.setTotalNoRecords(page.getTotalElements());

	return new ResponseEntity<String>(pagination.wrapResponse(Film
		.toJsonArray(pagination.toCollection(page))), headers,
		HttpStatus.OK);
    }
}
