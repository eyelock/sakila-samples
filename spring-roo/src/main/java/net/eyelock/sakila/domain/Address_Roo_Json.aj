// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.eyelock.sakila.domain.Address;

privileged aspect Address_Roo_Json {
    
    public static Address Address.fromJsonToAddress(String json) {
        return new JSONDeserializer<Address>()
        .use(null, Address.class).deserialize(json);
    }
    
    public static Collection<Address> Address.fromJsonArrayToAddresses(String json) {
        return new JSONDeserializer<List<Address>>()
        .use("values", Address.class).deserialize(json);
    }
    
}
