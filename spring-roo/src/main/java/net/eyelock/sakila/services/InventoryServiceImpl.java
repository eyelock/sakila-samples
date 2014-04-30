package net.eyelock.sakila.services;

import java.util.ArrayList;
import java.util.Collection;

import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Store;

public class InventoryServiceImpl implements InventoryService {
	@Override
	public Collection<Store> getStores(Film film) {
		Collection<Inventory> list = inventoryRepository.findByFilmId(film);
		
		Collection<Store> collection = new ArrayList<Store>();
		for (Inventory item : list) {
			collection.add(item.getStoreId());
		}
		
		return collection;
	}
	
	@Override
	public Collection<Film> getFilms(Store store) {
		Collection<Inventory> list = inventoryRepository.findByStoreId(store);
		
		Collection<Film> collection = new ArrayList<Film>();
		for (Inventory item : list) {
			collection.add(item.getFilmId());
		}
		
		return collection;
	}
}
