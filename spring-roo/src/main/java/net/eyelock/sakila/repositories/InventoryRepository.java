package net.eyelock.sakila.repositories;
import java.util.List;

import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Store;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Inventory.class)
public interface InventoryRepository {
	List<Inventory> findByFilmId(Film film);
	List<Inventory> findByStoreId(Store store);
	Long countByFilmId(Film film);
	Long countByStoreId(Store store);
}
