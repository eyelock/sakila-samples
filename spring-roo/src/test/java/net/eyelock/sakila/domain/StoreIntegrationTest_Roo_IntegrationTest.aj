// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.eyelock.sakila.domain.StoreDataOnDemand;
import net.eyelock.sakila.domain.StoreIntegrationTest;
import net.eyelock.sakila.repositories.StoreRepository;
import net.eyelock.sakila.services.StoreService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StoreIntegrationTest_Roo_IntegrationTest {
    
    declare @type: StoreIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: StoreIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: StoreIntegrationTest: @Transactional;
    
    @Autowired
    StoreDataOnDemand StoreIntegrationTest.dod;
    
    @Autowired
    StoreService StoreIntegrationTest.storeService;
    
    @Autowired
    StoreRepository StoreIntegrationTest.storeRepository;
    
    @Test
    public void StoreIntegrationTest.testCountAllStores() {
        Assert.assertNotNull("Data on demand for 'Store' failed to initialize correctly", dod.getRandomStore());
        long count = storeService.countAllStores();
        Assert.assertTrue("Counter for 'Store' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void StoreIntegrationTest.testFindStore() {
        Store obj = dod.getRandomStore();
        Assert.assertNotNull("Data on demand for 'Store' failed to initialize correctly", obj);
        Short id = obj.getStoreId();
        Assert.assertNotNull("Data on demand for 'Store' failed to provide an identifier", id);
        obj = storeService.findStore(id);
        Assert.assertNotNull("Find method for 'Store' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Store' returned the incorrect identifier", id, obj.getStoreId());
    }
    
    @Test
    public void StoreIntegrationTest.testFindAllStores() {
        Assert.assertNotNull("Data on demand for 'Store' failed to initialize correctly", dod.getRandomStore());
        long count = storeService.countAllStores();
        Assert.assertTrue("Too expensive to perform a find all test for 'Store', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Store> result = storeService.findAllStores();
        Assert.assertNotNull("Find all method for 'Store' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Store' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void StoreIntegrationTest.testFindStoreEntries() {
        Assert.assertNotNull("Data on demand for 'Store' failed to initialize correctly", dod.getRandomStore());
        long count = storeService.countAllStores();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Store> result = storeService.findStoreEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Store' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Store' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void StoreIntegrationTest.testSaveStore() {
        Assert.assertNotNull("Data on demand for 'Store' failed to initialize correctly", dod.getRandomStore());
        Store obj = dod.getNewTransientStore(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Store' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Store' identifier to be null", obj.getStoreId());
        try {
            storeService.saveStore(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        storeRepository.flush();
        Assert.assertNotNull("Expected 'Store' identifier to no longer be null", obj.getStoreId());
    }
    
    @Test
    public void StoreIntegrationTest.testDeleteStore() {
        Store obj = dod.getRandomStore();
        Assert.assertNotNull("Data on demand for 'Store' failed to initialize correctly", obj);
        Short id = obj.getStoreId();
        Assert.assertNotNull("Data on demand for 'Store' failed to provide an identifier", id);
        obj = storeService.findStore(id);
        storeService.deleteStore(obj);
        storeRepository.flush();
        Assert.assertNull("Failed to remove 'Store' with identifier '" + id + "'", storeService.findStore(id));
    }
    
}
