// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.util.List;
import net.eyelock.sakila.domain.Country;
import net.eyelock.sakila.web.CountryController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect CountryController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{countryId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CountryController.showJson(@PathVariable("countryId") Short countryId) {
        Country country = countryService.findCountry(countryId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (country == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(country.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> CountryController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Country> result = countryService.findAllCountrys();
        return new ResponseEntity<String>(Country.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        Country country = Country.fromJsonToCountry(json);
        countryService.saveCountry(country);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+country.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.createFromJsonArray(@RequestBody String json) {
        for (Country country: Country.fromJsonArrayToCountrys(json)) {
            countryService.saveCountry(country);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{countryId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.updateFromJson(@RequestBody String json, @PathVariable("countryId") Short countryId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Country country = Country.fromJsonToCountry(json);
        country.setCountryId(countryId);
        if (countryService.updateCountry(country) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{countryId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> CountryController.deleteFromJson(@PathVariable("countryId") Short countryId) {
        Country country = countryService.findCountry(countryId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (country == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        countryService.deleteCountry(country);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
