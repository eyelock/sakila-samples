// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import net.eyelock.sakila.domain.FilmText;

privileged aspect FilmText_Roo_DbManaged {
    
    @Column(name = "title", length = 255)
    @NotNull
    private String FilmText.title;
    
    @Column(name = "description")
    private String FilmText.description;
    
    public String FilmText.getTitle() {
        return title;
    }
    
    public void FilmText.setTitle(String title) {
        this.title = title;
    }
    
    public String FilmText.getDescription() {
        return description;
    }
    
    public void FilmText.setDescription(String description) {
        this.description = description;
    }
    
}
