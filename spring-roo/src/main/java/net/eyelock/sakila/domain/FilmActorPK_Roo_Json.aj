// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.eyelock.sakila.domain.FilmActorPK;

privileged aspect FilmActorPK_Roo_Json {
    
    public String FilmActorPK.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String FilmActorPK.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static FilmActorPK FilmActorPK.fromJsonToFilmActorPK(String json) {
        return new JSONDeserializer<FilmActorPK>()
        .use(null, FilmActorPK.class).deserialize(json);
    }
    
    public static String FilmActorPK.toJsonArray(Collection<FilmActorPK> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String FilmActorPK.toJsonArray(Collection<FilmActorPK> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<FilmActorPK> FilmActorPK.fromJsonArrayToFilmActorPKs(String json) {
        return new JSONDeserializer<List<FilmActorPK>>()
        .use("values", FilmActorPK.class).deserialize(json);
    }
    
}
