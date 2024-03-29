// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.eyelock.sakila.domain.FilmActorDataOnDemand;
import net.eyelock.sakila.domain.FilmActorIntegrationTest;
import net.eyelock.sakila.domain.FilmActorPK;
import net.eyelock.sakila.repositories.FilmActorRepository;
import net.eyelock.sakila.services.FilmActorService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FilmActorIntegrationTest_Roo_IntegrationTest {
    
    declare @type: FilmActorIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: FilmActorIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: FilmActorIntegrationTest: @Transactional;
    
    @Autowired
    FilmActorDataOnDemand FilmActorIntegrationTest.dod;
    
    @Autowired
    FilmActorService FilmActorIntegrationTest.filmActorService;
    
    @Autowired
    FilmActorRepository FilmActorIntegrationTest.filmActorRepository;
    
    @Test
    public void FilmActorIntegrationTest.testCountAllFilmActors() {
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to initialize correctly", dod.getRandomFilmActor());
        long count = filmActorService.countAllFilmActors();
        Assert.assertTrue("Counter for 'FilmActor' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void FilmActorIntegrationTest.testFindFilmActor() {
        FilmActor obj = dod.getRandomFilmActor();
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to initialize correctly", obj);
        FilmActorPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to provide an identifier", id);
        obj = filmActorService.findFilmActor(id);
        Assert.assertNotNull("Find method for 'FilmActor' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'FilmActor' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void FilmActorIntegrationTest.testFindAllFilmActors() {
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to initialize correctly", dod.getRandomFilmActor());
        long count = filmActorService.countAllFilmActors();
        Assert.assertTrue("Too expensive to perform a find all test for 'FilmActor', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<FilmActor> result = filmActorService.findAllFilmActors();
        Assert.assertNotNull("Find all method for 'FilmActor' illegally returned null", result);
        Assert.assertTrue("Find all method for 'FilmActor' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void FilmActorIntegrationTest.testFindFilmActorEntries() {
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to initialize correctly", dod.getRandomFilmActor());
        long count = filmActorService.countAllFilmActors();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<FilmActor> result = filmActorService.findFilmActorEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'FilmActor' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'FilmActor' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void FilmActorIntegrationTest.testSaveFilmActor() {
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to initialize correctly", dod.getRandomFilmActor());
        FilmActor obj = dod.getNewTransientFilmActor(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to provide a new transient entity", obj);
        try {
            filmActorService.saveFilmActor(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        filmActorRepository.flush();
        Assert.assertNotNull("Expected 'FilmActor' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void FilmActorIntegrationTest.testDeleteFilmActor() {
        FilmActor obj = dod.getRandomFilmActor();
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to initialize correctly", obj);
        FilmActorPK id = obj.getId();
        Assert.assertNotNull("Data on demand for 'FilmActor' failed to provide an identifier", id);
        obj = filmActorService.findFilmActor(id);
        filmActorService.deleteFilmActor(obj);
        filmActorRepository.flush();
        Assert.assertNull("Failed to remove 'FilmActor' with identifier '" + id + "'", filmActorService.findFilmActor(id));
    }
    
}
