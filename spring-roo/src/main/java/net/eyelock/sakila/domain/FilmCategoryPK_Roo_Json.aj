// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.eyelock.sakila.domain.FilmCategoryPK;

privileged aspect FilmCategoryPK_Roo_Json {
    
    public String FilmCategoryPK.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String FilmCategoryPK.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static FilmCategoryPK FilmCategoryPK.fromJsonToFilmCategoryPK(String json) {
        return new JSONDeserializer<FilmCategoryPK>()
        .use(null, FilmCategoryPK.class).deserialize(json);
    }
    
    public static String FilmCategoryPK.toJsonArray(Collection<FilmCategoryPK> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String FilmCategoryPK.toJsonArray(Collection<FilmCategoryPK> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<FilmCategoryPK> FilmCategoryPK.fromJsonArrayToFilmCategoryPKs(String json) {
        return new JSONDeserializer<List<FilmCategoryPK>>()
        .use("values", FilmCategoryPK.class).deserialize(json);
    }
    
}
