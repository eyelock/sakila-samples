// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.repositories;

import net.eyelock.sakila.domain.Language;
import net.eyelock.sakila.repositories.LanguageRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect LanguageRepository_Roo_Jpa_Repository {
    
    declare parents: LanguageRepository extends JpaRepository<Language, Short>;
    
    declare parents: LanguageRepository extends JpaSpecificationExecutor<Language>;
    
    declare @type: LanguageRepository: @Repository;
    
}