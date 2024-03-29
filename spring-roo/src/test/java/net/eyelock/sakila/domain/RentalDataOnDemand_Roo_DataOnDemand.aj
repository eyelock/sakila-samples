// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.CustomerDataOnDemand;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.InventoryDataOnDemand;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.RentalDataOnDemand;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.domain.StaffDataOnDemand;
import net.eyelock.sakila.repositories.RentalRepository;
import net.eyelock.sakila.services.RentalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RentalDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RentalDataOnDemand: @Component;
    
    private Random RentalDataOnDemand.rnd = new SecureRandom();
    
    private List<Rental> RentalDataOnDemand.data;
    
    @Autowired
    CustomerDataOnDemand RentalDataOnDemand.customerDataOnDemand;
    
    @Autowired
    InventoryDataOnDemand RentalDataOnDemand.inventoryDataOnDemand;
    
    @Autowired
    StaffDataOnDemand RentalDataOnDemand.staffDataOnDemand;
    
    @Autowired
    RentalService RentalDataOnDemand.rentalService;
    
    @Autowired
    RentalRepository RentalDataOnDemand.rentalRepository;
    
    public Rental RentalDataOnDemand.getNewTransientRental(int index) {
        Rental obj = new Rental();
        setCustomerId(obj, index);
        setInventoryId(obj, index);
        setLastUpdate(obj, index);
        setRentalDate(obj, index);
        setReturnDate(obj, index);
        setStaffId(obj, index);
        return obj;
    }
    
    public void RentalDataOnDemand.setCustomerId(Rental obj, int index) {
        Customer customerId = customerDataOnDemand.getRandomCustomer();
        obj.setCustomerId(customerId);
    }
    
    public void RentalDataOnDemand.setInventoryId(Rental obj, int index) {
        Inventory inventoryId = inventoryDataOnDemand.getRandomInventory();
        obj.setInventoryId(inventoryId);
    }
    
    public void RentalDataOnDemand.setLastUpdate(Rental obj, int index) {
        Calendar lastUpdate = Calendar.getInstance();
        obj.setLastUpdate(lastUpdate);
    }
    
    public void RentalDataOnDemand.setRentalDate(Rental obj, int index) {
        Calendar rentalDate = Calendar.getInstance();
        obj.setRentalDate(rentalDate);
    }
    
    public void RentalDataOnDemand.setReturnDate(Rental obj, int index) {
        Calendar returnDate = Calendar.getInstance();
        obj.setReturnDate(returnDate);
    }
    
    public void RentalDataOnDemand.setStaffId(Rental obj, int index) {
        Staff staffId = staffDataOnDemand.getRandomStaff();
        obj.setStaffId(staffId);
    }
    
    public Rental RentalDataOnDemand.getSpecificRental(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Rental obj = data.get(index);
        Integer id = obj.getRentalId();
        return rentalService.findRental(id);
    }
    
    public Rental RentalDataOnDemand.getRandomRental() {
        init();
        Rental obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getRentalId();
        return rentalService.findRental(id);
    }
    
    public boolean RentalDataOnDemand.modifyRental(Rental obj) {
        return false;
    }
    
    public void RentalDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = rentalService.findRentalEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Rental' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Rental>();
        for (int i = 0; i < 10; i++) {
            Rental obj = getNewTransientRental(i);
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
            data.add(obj);
        }
    }
    
}
