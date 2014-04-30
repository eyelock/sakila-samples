// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.util.List;
import net.eyelock.sakila.domain.FilmText;
import net.eyelock.sakila.web.FilmTextController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect FilmTextController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{filmId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FilmTextController.showJson(@PathVariable("filmId") Short filmId) {
        FilmText filmText = filmTextService.findFilmText(filmId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (filmText == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(filmText.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> FilmTextController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<FilmText> result = filmTextService.findAllFilmTexts();
        return new ResponseEntity<String>(FilmText.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> FilmTextController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        FilmText filmText = FilmText.fromJsonToFilmText(json);
        filmTextService.saveFilmText(filmText);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+filmText.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> FilmTextController.createFromJsonArray(@RequestBody String json) {
        for (FilmText filmText: FilmText.fromJsonArrayToFilmTexts(json)) {
            filmTextService.saveFilmText(filmText);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{filmId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> FilmTextController.updateFromJson(@RequestBody String json, @PathVariable("filmId") Short filmId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        FilmText filmText = FilmText.fromJsonToFilmText(json);
        filmText.setFilmId(filmId);
        if (filmTextService.updateFilmText(filmText) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{filmId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> FilmTextController.deleteFromJson(@PathVariable("filmId") Short filmId) {
        FilmText filmText = filmTextService.findFilmText(filmId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (filmText == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        filmTextService.deleteFilmText(filmText);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
