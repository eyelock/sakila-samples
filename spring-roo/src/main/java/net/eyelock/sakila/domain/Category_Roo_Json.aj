// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import flexjson.JSONDeserializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.eyelock.sakila.domain.Category;

privileged aspect Category_Roo_Json {
    
    public static Category Category.fromJsonToCategory(String json) {
        return new JSONDeserializer<Category>()
        .use(null, Category.class).deserialize(json);
    }
    
    public static Collection<Category> Category.fromJsonArrayToCategorys(String json) {
        return new JSONDeserializer<List<Category>>()
        .use("values", Category.class).deserialize(json);
    }
    
}
