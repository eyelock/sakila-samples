// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import java.util.List;
import net.eyelock.sakila.domain.Language;
import net.eyelock.sakila.web.LanguageController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponentsBuilder;

privileged aspect LanguageController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{languageId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LanguageController.showJson(@PathVariable("languageId") Short languageId) {
        Language language = languageService.findLanguage(languageId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (language == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(language.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> LanguageController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Language> result = languageService.findAllLanguages();
        return new ResponseEntity<String>(Language.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> LanguageController.createFromJson(@RequestBody String json, UriComponentsBuilder uriBuilder) {
        Language language = Language.fromJsonToLanguage(json);
        languageService.saveLanguage(language);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        RequestMapping a = (RequestMapping) getClass().getAnnotation(RequestMapping.class);
        headers.add("Location",uriBuilder.path(a.value()[0]+"/"+language.getId().toString()).build().toUriString());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> LanguageController.createFromJsonArray(@RequestBody String json) {
        for (Language language: Language.fromJsonArrayToLanguages(json)) {
            languageService.saveLanguage(language);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/{languageId}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> LanguageController.updateFromJson(@RequestBody String json, @PathVariable("languageId") Short languageId) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Language language = Language.fromJsonToLanguage(json);
        language.setLanguageId(languageId);
        if (languageService.updateLanguage(language) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{languageId}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> LanguageController.deleteFromJson(@PathVariable("languageId") Short languageId) {
        Language language = languageService.findLanguage(languageId);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (language == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        languageService.deleteLanguage(language);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
