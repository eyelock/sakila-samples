// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.eyelock.sakila.domain.RentalDataOnDemand;
import net.eyelock.sakila.domain.RentalIntegrationTest;
import net.eyelock.sakila.repositories.RentalRepository;
import net.eyelock.sakila.services.RentalService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RentalIntegrationTest_Roo_IntegrationTest {
    
    declare @type: RentalIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: RentalIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: RentalIntegrationTest: @Transactional;
    
    @Autowired
    RentalDataOnDemand RentalIntegrationTest.dod;
    
    @Autowired
    RentalService RentalIntegrationTest.rentalService;
    
    @Autowired
    RentalRepository RentalIntegrationTest.rentalRepository;
    
    @Test
    public void RentalIntegrationTest.testCountAllRentals() {
        Assert.assertNotNull("Data on demand for 'Rental' failed to initialize correctly", dod.getRandomRental());
        long count = rentalService.countAllRentals();
        Assert.assertTrue("Counter for 'Rental' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void RentalIntegrationTest.testFindRental() {
        Rental obj = dod.getRandomRental();
        Assert.assertNotNull("Data on demand for 'Rental' failed to initialize correctly", obj);
        Integer id = obj.getRentalId();
        Assert.assertNotNull("Data on demand for 'Rental' failed to provide an identifier", id);
        obj = rentalService.findRental(id);
        Assert.assertNotNull("Find method for 'Rental' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Rental' returned the incorrect identifier", id, obj.getRentalId());
    }
    
    @Test
    public void RentalIntegrationTest.testFindAllRentals() {
        Assert.assertNotNull("Data on demand for 'Rental' failed to initialize correctly", dod.getRandomRental());
        long count = rentalService.countAllRentals();
        Assert.assertTrue("Too expensive to perform a find all test for 'Rental', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Rental> result = rentalService.findAllRentals();
        Assert.assertNotNull("Find all method for 'Rental' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Rental' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void RentalIntegrationTest.testFindRentalEntries() {
        Assert.assertNotNull("Data on demand for 'Rental' failed to initialize correctly", dod.getRandomRental());
        long count = rentalService.countAllRentals();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Rental> result = rentalService.findRentalEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Rental' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Rental' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void RentalIntegrationTest.testSaveRental() {
        Assert.assertNotNull("Data on demand for 'Rental' failed to initialize correctly", dod.getRandomRental());
        Rental obj = dod.getNewTransientRental(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Rental' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Rental' identifier to be null", obj.getRentalId());
        try {
            rentalService.saveRental(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        rentalRepository.flush();
        Assert.assertNotNull("Expected 'Rental' identifier to no longer be null", obj.getRentalId());
    }
    
    @Test
    public void RentalIntegrationTest.testDeleteRental() {
        Rental obj = dod.getRandomRental();
        Assert.assertNotNull("Data on demand for 'Rental' failed to initialize correctly", obj);
        Integer id = obj.getRentalId();
        Assert.assertNotNull("Data on demand for 'Rental' failed to provide an identifier", id);
        obj = rentalService.findRental(id);
        rentalService.deleteRental(obj);
        rentalRepository.flush();
        Assert.assertNull("Failed to remove 'Rental' with identifier '" + id + "'", rentalService.findRental(id));
    }
    
}
