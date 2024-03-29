// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.util.List;
import net.eyelock.sakila.domain.City;
import net.eyelock.sakila.web.CityController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect CityController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{cityId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CityController.showJson(@PathVariable("cityId") Short cityId) {
        City city = cityService.findCity(cityId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (city == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(city.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CityController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<City> result = cityService.findAllCitys();
        return new ResponseEntity<String>(City.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CityController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        City city = City.fromJsonToCity(json);
        cityService.saveCity(city);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+city.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CityController.createFromJsonArray(@RequestBody String json) {
        for (City city: City.fromJsonArrayToCitys(json)) {
            cityService.saveCity(city);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{cityId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CityController.updateFromJson(@RequestBody String json, @PathVariable("cityId") Short cityId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        City city = City.fromJsonToCity(json);
        city.setCityId(cityId);
        if (cityService.updateCity(city) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{cityId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CityController.deleteFromJson(@PathVariable("cityId") Short cityId) {
        City city = cityService.findCity(cityId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (city == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        cityService.deleteCity(city);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
