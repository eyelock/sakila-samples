// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.util.Calendar;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import net.eyelock.sakila.domain.Address;
import net.eyelock.sakila.domain.Payment;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.domain.Store;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Staff_Roo_DbManaged {
    
    @OneToMany(mappedBy = "staffId", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private Set<Payment> Staff.payments;
    
    @OneToMany(mappedBy = "staffId", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private Set<Rental> Staff.rentals;
    
    @OneToMany(mappedBy = "managerStaffId", cascade = { CascadeType.PERSIST, CascadeType.MERGE })
    private Set<Store> Staff.stores;
    
    @ManyToOne
    @JoinColumn(name = "store_id", referencedColumnName = "store_id", nullable = false)
    private Store Staff.storeId;
    
    @ManyToOne
    @JoinColumn(name = "address_id", referencedColumnName = "address_id", nullable = false)
    private Address Staff.addressId;
    
    @Column(name = "first_name", length = 45)
    @NotNull
    private String Staff.firstName;
    
    @Column(name = "last_name", length = 45)
    @NotNull
    private String Staff.lastName;
    
    @Column(name = "picture")
    private byte[] Staff.picture;
    
    @Column(name = "email", length = 50)
    private String Staff.email;
    
    @Column(name = "active")
    @NotNull
    private boolean Staff.active;
    
    @Column(name = "username", length = 16)
    @NotNull
    private String Staff.username;
    
    @Column(name = "password", length = 40)
    private String Staff.password;
    
    @Column(name = "last_update")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Staff.lastUpdate;
    
    public Set<Payment> Staff.getPayments() {
        return payments;
    }
    
    public void Staff.setPayments(Set<Payment> payments) {
        this.payments = payments;
    }
    
    public Set<Rental> Staff.getRentals() {
        return rentals;
    }
    
    public void Staff.setRentals(Set<Rental> rentals) {
        this.rentals = rentals;
    }
    
    public Set<Store> Staff.getStores() {
        return stores;
    }
    
    public void Staff.setStores(Set<Store> stores) {
        this.stores = stores;
    }
    
    public Store Staff.getStoreId() {
        return storeId;
    }
    
    public void Staff.setStoreId(Store storeId) {
        this.storeId = storeId;
    }
    
    public Address Staff.getAddressId() {
        return addressId;
    }
    
    public void Staff.setAddressId(Address addressId) {
        this.addressId = addressId;
    }
    
    public String Staff.getFirstName() {
        return firstName;
    }
    
    public void Staff.setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String Staff.getLastName() {
        return lastName;
    }
    
    public void Staff.setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public byte[] Staff.getPicture() {
        return picture;
    }
    
    public void Staff.setPicture(byte[] picture) {
        this.picture = picture;
    }
    
    public String Staff.getEmail() {
        return email;
    }
    
    public void Staff.setEmail(String email) {
        this.email = email;
    }
    
    public boolean Staff.isActive() {
        return active;
    }
    
    public void Staff.setActive(boolean active) {
        this.active = active;
    }
    
    public String Staff.getUsername() {
        return username;
    }
    
    public void Staff.setUsername(String username) {
        this.username = username;
    }
    
    public String Staff.getPassword() {
        return password;
    }
    
    public void Staff.setPassword(String password) {
        this.password = password;
    }
    
    public Calendar Staff.getLastUpdate() {
        return lastUpdate;
    }
    
    public void Staff.setLastUpdate(Calendar lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
}
