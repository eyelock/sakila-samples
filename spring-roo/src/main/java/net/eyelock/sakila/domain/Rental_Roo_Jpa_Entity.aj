// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import net.eyelock.sakila.domain.Rental;

privileged aspect Rental_Roo_Jpa_Entity {
    
    declare @type: Rental: @Entity;
    
    declare @type: Rental: @Table(name = "rental");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "rental_id")
    private Integer Rental.rentalId;
    
    public Integer Rental.getRentalId() {
        return this.rentalId;
    }
    
    public void Rental.setRentalId(Integer id) {
        this.rentalId = id;
    }
    
}
