// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import java.math.BigDecimal;
import java.util.Calendar;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Payment;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect Payment_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "rental_id", referencedColumnName = "rental_id")
    private Rental Payment.rentalId;
    
    @ManyToOne
    @JoinColumn(name = "customer_id", referencedColumnName = "customer_id", nullable = false)
    private Customer Payment.customerId;
    
    @ManyToOne
    @JoinColumn(name = "staff_id", referencedColumnName = "staff_id", nullable = false)
    private Staff Payment.staffId;
    
    @Column(name = "amount", precision = 5, scale = 2)
    @NotNull
    private BigDecimal Payment.amount;
    
    @Column(name = "payment_date")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Payment.paymentDate;
    
    @Column(name = "last_update")
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Calendar Payment.lastUpdate;
    
    public Rental Payment.getRentalId() {
        return rentalId;
    }
    
    public void Payment.setRentalId(Rental rentalId) {
        this.rentalId = rentalId;
    }
    
    public Customer Payment.getCustomerId() {
        return customerId;
    }
    
    public void Payment.setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }
    
    public Staff Payment.getStaffId() {
        return staffId;
    }
    
    public void Payment.setStaffId(Staff staffId) {
        this.staffId = staffId;
    }
    
    public BigDecimal Payment.getAmount() {
        return amount;
    }
    
    public void Payment.setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public Calendar Payment.getPaymentDate() {
        return paymentDate;
    }
    
    public void Payment.setPaymentDate(Calendar paymentDate) {
        this.paymentDate = paymentDate;
    }
    
    public Calendar Payment.getLastUpdate() {
        return lastUpdate;
    }
    
    public void Payment.setLastUpdate(Calendar lastUpdate) {
        this.lastUpdate = lastUpdate;
    }
    
}
