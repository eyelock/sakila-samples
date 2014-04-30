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
import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.ActorDataOnDemand;
import net.eyelock.sakila.repositories.ActorRepository;
import net.eyelock.sakila.services.ActorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ActorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ActorDataOnDemand: @Component;
    
    private Random ActorDataOnDemand.rnd = new SecureRandom();
    
    private List<Actor> ActorDataOnDemand.data;
    
    @Autowired
    ActorService ActorDataOnDemand.actorService;
    
    @Autowired
    ActorRepository ActorDataOnDemand.actorRepository;
    
    public Actor ActorDataOnDemand.getNewTransientActor(int index) {
        Actor obj = new Actor();
        setFirstName(obj, index);
        setLastName(obj, index);
        setLastUpdate(obj, index);
        return obj;
    }
    
    public void ActorDataOnDemand.setFirstName(Actor obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 45) {
            firstName = firstName.substring(0, 45);
        }
        obj.setFirstName(firstName);
    }
    
    public void ActorDataOnDemand.setLastName(Actor obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 45) {
            lastName = lastName.substring(0, 45);
        }
        obj.setLastName(lastName);
    }
    
    public void ActorDataOnDemand.setLastUpdate(Actor obj, int index) {
        Calendar lastUpdate = Calendar.getInstance();
        obj.setLastUpdate(lastUpdate);
    }
    
    public Actor ActorDataOnDemand.getSpecificActor(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Actor obj = data.get(index);
        Short id = obj.getActorId();
        return actorService.findActor(id);
    }
    
    public Actor ActorDataOnDemand.getRandomActor() {
        init();
        Actor obj = data.get(rnd.nextInt(data.size()));
        Short id = obj.getActorId();
        return actorService.findActor(id);
    }
    
    public boolean ActorDataOnDemand.modifyActor(Actor obj) {
        return false;
    }
    
    public void ActorDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = actorService.findActorEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Actor' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Actor>();
        for (int i = 0; i < 10; i++) {
            Actor obj = getNewTransientActor(i);
            try {
                actorService.saveActor(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            actorRepository.flush();
            data.add(obj);
        }
    }
    
}
