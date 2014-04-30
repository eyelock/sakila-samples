// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.eyelock.sakila.domain.FilmTextDataOnDemand;
import net.eyelock.sakila.domain.FilmTextIntegrationTest;
import net.eyelock.sakila.repositories.FilmTextRepository;
import net.eyelock.sakila.services.FilmTextService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FilmTextIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FilmTextIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FilmTextIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FilmTextIntegrationTest: @Transactional;
    
    @Autowired
    FilmTextDataOnDemand FilmTextIntegrationTest.dod;
    
    @Autowired
    FilmTextService FilmTextIntegrationTest.filmTextService;
    
    @Autowired
    FilmTextRepository FilmTextIntegrationTest.filmTextRepository;
    
    @Test
    public void FilmTextIntegrationTest.testCountAllFilmTexts() {
        Assert.assertNotNull("Data on demand for 'FilmText' failed to initialize correctly", dod.getRandomFilmText());
        long count = filmTextService.countAllFilmTexts();
        Assert.assertTrue("Counter for 'FilmText' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FilmTextIntegrationTest.testFindFilmText() {
        FilmText obj = dod.getRandomFilmText();
        Assert.assertNotNull("Data on demand for 'FilmText' failed to initialize correctly", obj);
        Short id = obj.getFilmId();
        Assert.assertNotNull("Data on demand for 'FilmText' failed to provide an identifier", id);
        obj = filmTextService.findFilmText(id);
        Assert.assertNotNull("Find method for 'FilmText' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'FilmText' returned the incorrect identifier", id, obj.getFilmId());
    }
    
    @Test
    public void FilmTextIntegrationTest.testFindAllFilmTexts() {
        Assert.assertNotNull("Data on demand for 'FilmText' failed to initialize correctly", dod.getRandomFilmText());
        long count = filmTextService.countAllFilmTexts();
        Assert.assertTrue("Too expensive to perform a find all test for 'FilmText', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<FilmText> result = filmTextService.findAllFilmTexts();
        Assert.assertNotNull("Find all method for 'FilmText' illegally returned null", result);
        Assert.assertTrue("Find all method for 'FilmText' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FilmTextIntegrationTest.testFindFilmTextEntries() {
        Assert.assertNotNull("Data on demand for 'FilmText' failed to initialize correctly", dod.getRandomFilmText());
        long count = filmTextService.countAllFilmTexts();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<FilmText> result = filmTextService.findFilmTextEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'FilmText' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'FilmText' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FilmTextIntegrationTest.testSaveFilmText() {
        Assert.assertNotNull("Data on demand for 'FilmText' failed to initialize correctly", dod.getRandomFilmText());
        FilmText obj = dod.getNewTransientFilmText(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'FilmText' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'FilmText' identifier to be null", obj.getFilmId());
        try {
            filmTextService.saveFilmText(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        filmTextRepository.flush();
        Assert.assertNotNull("Expected 'FilmText' identifier to no longer be null", obj.getFilmId());
    }
    
    @Test
    public void FilmTextIntegrationTest.testDeleteFilmText() {
        FilmText obj = dod.getRandomFilmText();
        Assert.assertNotNull("Data on demand for 'FilmText' failed to initialize correctly", obj);
        Short id = obj.getFilmId();
        Assert.assertNotNull("Data on demand for 'FilmText' failed to provide an identifier", id);
        obj = filmTextService.findFilmText(id);
        filmTextService.deleteFilmText(obj);
        filmTextRepository.flush();
        Assert.assertNull("Failed to remove 'FilmText' with identifier '" + id + "'", filmTextService.findFilmText(id));
    }
    
}