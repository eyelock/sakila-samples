// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import net.eyelock.sakila.domain.FilmCategoryPK;

privileged aspect FilmCategoryPK_Roo_Identifier {
    
    declare @type: FilmCategoryPK: @Embeddable;
    
    @Column(name = "film_id", nullable = false)
    private Short FilmCategoryPK.filmId;
    
    @Column(name = "category_id", nullable = false)
    private Short FilmCategoryPK.categoryId;
    
    public FilmCategoryPK.new(Short filmId, Short categoryId) {
        super();
        this.filmId = filmId;
        this.categoryId = categoryId;
    }

    private FilmCategoryPK.new() {
        super();
    }

    public Short FilmCategoryPK.getFilmId() {
        return filmId;
    }
    
    public Short FilmCategoryPK.getCategoryId() {
        return categoryId;
    }
    
}
