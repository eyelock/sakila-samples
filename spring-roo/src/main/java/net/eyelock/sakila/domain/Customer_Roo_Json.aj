// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.eyelock.sakila.domain.Customer;

privileged aspect Customer_Roo_Json {
    
    public static Customer Customer.fromJsonToCustomer(String json) {
        return new JSONDeserializer<Customer>()
        .use(null, Customer.class).deserialize(json);
    }
    
    public static Collection<Customer> Customer.fromJsonArrayToCustomers(String json) {
        return new JSONDeserializer<List<Customer>>()
        .use("values", Customer.class).deserialize(json);
    }
    
}
