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
import net.eyelock.sakila.domain.Address;
import net.eyelock.sakila.domain.AddressDataOnDemand;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.domain.StaffDataOnDemand;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.domain.StoreDataOnDemand;
import net.eyelock.sakila.repositories.StaffRepository;
import net.eyelock.sakila.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect StaffDataOnDemand_Roo_DataOnDemand {
    
    declare @type: StaffDataOnDemand: @Component;
    
    private Random StaffDataOnDemand.rnd = new SecureRandom();
    
    private List<Staff> StaffDataOnDemand.data;
    
    @Autowired
    AddressDataOnDemand StaffDataOnDemand.addressDataOnDemand;
    
    @Autowired
    StoreDataOnDemand StaffDataOnDemand.storeDataOnDemand;
    
    @Autowired
    StaffService StaffDataOnDemand.staffService;
    
    @Autowired
    StaffRepository StaffDataOnDemand.staffRepository;
    
    public Staff StaffDataOnDemand.getNewTransientStaff(int index) {
        Staff obj = new Staff();
        setActive(obj, index);
        setAddressId(obj, index);
        setEmail(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setLastUpdate(obj, index);
        setPassword(obj, index);
        setPicture(obj, index);
        setStoreId(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void StaffDataOnDemand.setActive(Staff obj, int index) {
        Boolean active = true;
        obj.setActive(active);
    }
    
    public void StaffDataOnDemand.setAddressId(Staff obj, int index) {
        Address addressId = addressDataOnDemand.getRandomAddress();
        obj.setAddressId(addressId);
    }
    
    public void StaffDataOnDemand.setEmail(Staff obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 50) {
            email = email.substring(0, 50);
        }
        obj.setEmail(email);
    }
    
    public void StaffDataOnDemand.setFirstName(Staff obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 45) {
            firstName = firstName.substring(0, 45);
        }
        obj.setFirstName(firstName);
    }
    
    public void StaffDataOnDemand.setLastName(Staff obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 45) {
            lastName = lastName.substring(0, 45);
        }
        obj.setLastName(lastName);
    }
    
    public void StaffDataOnDemand.setLastUpdate(Staff obj, int index) {
        Calendar lastUpdate = Calendar.getInstance();
        obj.setLastUpdate(lastUpdate);
    }
    
    public void StaffDataOnDemand.setPassword(Staff obj, int index) {
        String password = "password_" + index;
        if (password.length() > 40) {
            password = password.substring(0, 40);
        }
        obj.setPassword(password);
    }
    
    public void StaffDataOnDemand.setPicture(Staff obj, int index) {
        byte[] picture = String.valueOf(index).getBytes();
        obj.setPicture(picture);
    }
    
    public void StaffDataOnDemand.setStoreId(Staff obj, int index) {
        Store storeId = storeDataOnDemand.getRandomStore();
        obj.setStoreId(storeId);
    }
    
    public void StaffDataOnDemand.setUsername(Staff obj, int index) {
        String username = "username_" + index;
        if (username.length() > 16) {
            username = username.substring(0, 16);
        }
        obj.setUsername(username);
    }
    
    public Staff StaffDataOnDemand.getSpecificStaff(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Staff obj = data.get(index);
        Short id = obj.getStaffId();
        return staffService.findStaff(id);
    }
    
    public Staff StaffDataOnDemand.getRandomStaff() {
        init();
        Staff obj = data.get(rnd.nextInt(data.size()));
        Short id = obj.getStaffId();
        return staffService.findStaff(id);
    }
    
    public boolean StaffDataOnDemand.modifyStaff(Staff obj) {
        return false;
    }
    
    public void StaffDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = staffService.findStaffEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Staff' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Staff>();
        for (int i = 0; i < 10; i++) {
            Staff obj = getNewTransientStaff(i);
            try {
                staffService.saveStaff(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            staffRepository.flush();
            data.add(obj);
        }
    }
    
}