package net.eyelock.sakila.services;
import java.util.Collection;

import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Store;

import org.springframework.roo.addon.layers.service.RooService;

@RooService(domainTypes = { net.eyelock.sakila.domain.Inventory.class })
public interface InventoryService {

	Collection<Store> getStores(Film film);

	Collection<Film> getFilms(Store store);
}
