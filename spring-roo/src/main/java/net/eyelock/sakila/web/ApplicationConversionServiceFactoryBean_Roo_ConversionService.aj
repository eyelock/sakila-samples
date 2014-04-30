// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package net.eyelock.sakila.web;

import net.eyelock.sakila.domain.Actor;
import net.eyelock.sakila.domain.Address;
import net.eyelock.sakila.domain.Category;
import net.eyelock.sakila.domain.City;
import net.eyelock.sakila.domain.Country;
import net.eyelock.sakila.domain.Customer;
import net.eyelock.sakila.domain.Film;
import net.eyelock.sakila.domain.FilmActor;
import net.eyelock.sakila.domain.FilmActorPK;
import net.eyelock.sakila.domain.FilmCategory;
import net.eyelock.sakila.domain.FilmCategoryPK;
import net.eyelock.sakila.domain.FilmText;
import net.eyelock.sakila.domain.Inventory;
import net.eyelock.sakila.domain.Language;
import net.eyelock.sakila.domain.Payment;
import net.eyelock.sakila.domain.Rental;
import net.eyelock.sakila.domain.Staff;
import net.eyelock.sakila.domain.Store;
import net.eyelock.sakila.services.ActorService;
import net.eyelock.sakila.services.AddressService;
import net.eyelock.sakila.services.CategoryService;
import net.eyelock.sakila.services.CityService;
import net.eyelock.sakila.services.CountryService;
import net.eyelock.sakila.services.CustomerService;
import net.eyelock.sakila.services.FilmActorService;
import net.eyelock.sakila.services.FilmCategoryService;
import net.eyelock.sakila.services.FilmService;
import net.eyelock.sakila.services.FilmTextService;
import net.eyelock.sakila.services.InventoryService;
import net.eyelock.sakila.services.LanguageService;
import net.eyelock.sakila.services.PaymentService;
import net.eyelock.sakila.services.RentalService;
import net.eyelock.sakila.services.StaffService;
import net.eyelock.sakila.services.StoreService;
import net.eyelock.sakila.web.ApplicationConversionServiceFactoryBean;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    ActorService ApplicationConversionServiceFactoryBean.actorService;
    
    @Autowired
    AddressService ApplicationConversionServiceFactoryBean.addressService;
    
    @Autowired
    CategoryService ApplicationConversionServiceFactoryBean.categoryService;
    
    @Autowired
    CityService ApplicationConversionServiceFactoryBean.cityService;
    
    @Autowired
    CountryService ApplicationConversionServiceFactoryBean.countryService;
    
    @Autowired
    CustomerService ApplicationConversionServiceFactoryBean.customerService;
    
    @Autowired
    FilmService ApplicationConversionServiceFactoryBean.filmService;
    
    @Autowired
    FilmActorService ApplicationConversionServiceFactoryBean.filmActorService;
    
    @Autowired
    FilmCategoryService ApplicationConversionServiceFactoryBean.filmCategoryService;
    
    @Autowired
    FilmTextService ApplicationConversionServiceFactoryBean.filmTextService;
    
    @Autowired
    InventoryService ApplicationConversionServiceFactoryBean.inventoryService;
    
    @Autowired
    LanguageService ApplicationConversionServiceFactoryBean.languageService;
    
    @Autowired
    PaymentService ApplicationConversionServiceFactoryBean.paymentService;
    
    @Autowired
    RentalService ApplicationConversionServiceFactoryBean.rentalService;
    
    @Autowired
    StaffService ApplicationConversionServiceFactoryBean.staffService;
    
    @Autowired
    StoreService ApplicationConversionServiceFactoryBean.storeService;
    
    public Converter<Actor, String> ApplicationConversionServiceFactoryBean.getActorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Actor, java.lang.String>() {
            public String convert(Actor actor) {
                return new StringBuilder().append(actor.getFirstName()).append(' ').append(actor.getLastName()).append(' ').append(actor.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, Actor> ApplicationConversionServiceFactoryBean.getIdToActorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Actor>() {
            public net.eyelock.sakila.domain.Actor convert(java.lang.Short id) {
                return actorService.findActor(id);
            }
        };
    }
    
    public Converter<String, Actor> ApplicationConversionServiceFactoryBean.getStringToActorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Actor>() {
            public net.eyelock.sakila.domain.Actor convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Actor.class);
            }
        };
    }
    
    public Converter<Address, String> ApplicationConversionServiceFactoryBean.getAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Address, java.lang.String>() {
            public String convert(Address address) {
                return new StringBuilder().append(address.getAddress()).append(' ').append(address.getAddress2()).append(' ').append(address.getDistrict()).append(' ').append(address.getPostalCode()).toString();
            }
        };
    }
    
    public Converter<Short, Address> ApplicationConversionServiceFactoryBean.getIdToAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Address>() {
            public net.eyelock.sakila.domain.Address convert(java.lang.Short id) {
                return addressService.findAddress(id);
            }
        };
    }
    
    public Converter<String, Address> ApplicationConversionServiceFactoryBean.getStringToAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Address>() {
            public net.eyelock.sakila.domain.Address convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Address.class);
            }
        };
    }
    
    public Converter<Category, String> ApplicationConversionServiceFactoryBean.getCategoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Category, java.lang.String>() {
            public String convert(Category category) {
                return new StringBuilder().append(category.getName()).append(' ').append(category.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, Category> ApplicationConversionServiceFactoryBean.getIdToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Category>() {
            public net.eyelock.sakila.domain.Category convert(java.lang.Short id) {
                return categoryService.findCategory(id);
            }
        };
    }
    
    public Converter<String, Category> ApplicationConversionServiceFactoryBean.getStringToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Category>() {
            public net.eyelock.sakila.domain.Category convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Category.class);
            }
        };
    }
    
    public Converter<City, String> ApplicationConversionServiceFactoryBean.getCityToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.City, java.lang.String>() {
            public String convert(City city) {
                return new StringBuilder().append(city.getCity()).append(' ').append(city.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, City> ApplicationConversionServiceFactoryBean.getIdToCityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.City>() {
            public net.eyelock.sakila.domain.City convert(java.lang.Short id) {
                return cityService.findCity(id);
            }
        };
    }
    
    public Converter<String, City> ApplicationConversionServiceFactoryBean.getStringToCityConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.City>() {
            public net.eyelock.sakila.domain.City convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), City.class);
            }
        };
    }
    
    public Converter<Country, String> ApplicationConversionServiceFactoryBean.getCountryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Country, java.lang.String>() {
            public String convert(Country country) {
                return new StringBuilder().append(country.getCountry()).append(' ').append(country.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, Country> ApplicationConversionServiceFactoryBean.getIdToCountryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Country>() {
            public net.eyelock.sakila.domain.Country convert(java.lang.Short id) {
                return countryService.findCountry(id);
            }
        };
    }
    
    public Converter<String, Country> ApplicationConversionServiceFactoryBean.getStringToCountryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Country>() {
            public net.eyelock.sakila.domain.Country convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Country.class);
            }
        };
    }
    
    public Converter<Customer, String> ApplicationConversionServiceFactoryBean.getCustomerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Customer, java.lang.String>() {
            public String convert(Customer customer) {
                return new StringBuilder().append(customer.getFirstName()).append(' ').append(customer.getLastName()).append(' ').append(customer.getEmail()).append(' ').append(customer.getCreateDate()).toString();
            }
        };
    }
    
    public Converter<Short, Customer> ApplicationConversionServiceFactoryBean.getIdToCustomerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Customer>() {
            public net.eyelock.sakila.domain.Customer convert(java.lang.Short id) {
                return customerService.findCustomer(id);
            }
        };
    }
    
    public Converter<String, Customer> ApplicationConversionServiceFactoryBean.getStringToCustomerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Customer>() {
            public net.eyelock.sakila.domain.Customer convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Customer.class);
            }
        };
    }
    
    public Converter<Film, String> ApplicationConversionServiceFactoryBean.getFilmToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Film, java.lang.String>() {
            public String convert(Film film) {
                return new StringBuilder().append(film.getTitle()).append(' ').append(film.getDescription()).append(' ').append(film.getReleaseYear()).append(' ').append(film.getRentalDuration()).toString();
            }
        };
    }
    
    public Converter<Short, Film> ApplicationConversionServiceFactoryBean.getIdToFilmConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Film>() {
            public net.eyelock.sakila.domain.Film convert(java.lang.Short id) {
                return filmService.findFilm(id);
            }
        };
    }
    
    public Converter<String, Film> ApplicationConversionServiceFactoryBean.getStringToFilmConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Film>() {
            public net.eyelock.sakila.domain.Film convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Film.class);
            }
        };
    }
    
    public Converter<FilmActor, String> ApplicationConversionServiceFactoryBean.getFilmActorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmActor, java.lang.String>() {
            public String convert(FilmActor filmActor) {
                return new StringBuilder().append(filmActor.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<FilmActorPK, FilmActor> ApplicationConversionServiceFactoryBean.getIdToFilmActorConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmActorPK, net.eyelock.sakila.domain.FilmActor>() {
            public net.eyelock.sakila.domain.FilmActor convert(net.eyelock.sakila.domain.FilmActorPK id) {
                return filmActorService.findFilmActor(id);
            }
        };
    }
    
    public Converter<String, FilmActor> ApplicationConversionServiceFactoryBean.getStringToFilmActorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.FilmActor>() {
            public net.eyelock.sakila.domain.FilmActor convert(String id) {
                return getObject().convert(getObject().convert(id, FilmActorPK.class), FilmActor.class);
            }
        };
    }
    
    public Converter<FilmCategory, String> ApplicationConversionServiceFactoryBean.getFilmCategoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmCategory, java.lang.String>() {
            public String convert(FilmCategory filmCategory) {
                return new StringBuilder().append(filmCategory.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<FilmCategoryPK, FilmCategory> ApplicationConversionServiceFactoryBean.getIdToFilmCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmCategoryPK, net.eyelock.sakila.domain.FilmCategory>() {
            public net.eyelock.sakila.domain.FilmCategory convert(net.eyelock.sakila.domain.FilmCategoryPK id) {
                return filmCategoryService.findFilmCategory(id);
            }
        };
    }
    
    public Converter<String, FilmCategory> ApplicationConversionServiceFactoryBean.getStringToFilmCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.FilmCategory>() {
            public net.eyelock.sakila.domain.FilmCategory convert(String id) {
                return getObject().convert(getObject().convert(id, FilmCategoryPK.class), FilmCategory.class);
            }
        };
    }
    
    public Converter<FilmText, String> ApplicationConversionServiceFactoryBean.getFilmTextToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmText, java.lang.String>() {
            public String convert(FilmText filmText) {
                return new StringBuilder().append(filmText.getTitle()).append(' ').append(filmText.getDescription()).toString();
            }
        };
    }
    
    public Converter<Short, FilmText> ApplicationConversionServiceFactoryBean.getIdToFilmTextConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.FilmText>() {
            public net.eyelock.sakila.domain.FilmText convert(java.lang.Short id) {
                return filmTextService.findFilmText(id);
            }
        };
    }
    
    public Converter<String, FilmText> ApplicationConversionServiceFactoryBean.getStringToFilmTextConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.FilmText>() {
            public net.eyelock.sakila.domain.FilmText convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), FilmText.class);
            }
        };
    }
    
    public Converter<Inventory, String> ApplicationConversionServiceFactoryBean.getInventoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Inventory, java.lang.String>() {
            public String convert(Inventory inventory) {
                return new StringBuilder().append(inventory.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Integer, Inventory> ApplicationConversionServiceFactoryBean.getIdToInventoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, net.eyelock.sakila.domain.Inventory>() {
            public net.eyelock.sakila.domain.Inventory convert(java.lang.Integer id) {
                return inventoryService.findInventory(id);
            }
        };
    }
    
    public Converter<String, Inventory> ApplicationConversionServiceFactoryBean.getStringToInventoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Inventory>() {
            public net.eyelock.sakila.domain.Inventory convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Inventory.class);
            }
        };
    }
    
    public Converter<Language, String> ApplicationConversionServiceFactoryBean.getLanguageToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Language, java.lang.String>() {
            public String convert(Language language) {
                return new StringBuilder().append(language.getName()).append(' ').append(language.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, Language> ApplicationConversionServiceFactoryBean.getIdToLanguageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Language>() {
            public net.eyelock.sakila.domain.Language convert(java.lang.Short id) {
                return languageService.findLanguage(id);
            }
        };
    }
    
    public Converter<String, Language> ApplicationConversionServiceFactoryBean.getStringToLanguageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Language>() {
            public net.eyelock.sakila.domain.Language convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Language.class);
            }
        };
    }
    
    public Converter<Payment, String> ApplicationConversionServiceFactoryBean.getPaymentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Payment, java.lang.String>() {
            public String convert(Payment payment) {
                return new StringBuilder().append(payment.getAmount()).append(' ').append(payment.getPaymentDate()).append(' ').append(payment.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, Payment> ApplicationConversionServiceFactoryBean.getIdToPaymentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Payment>() {
            public net.eyelock.sakila.domain.Payment convert(java.lang.Short id) {
                return paymentService.findPayment(id);
            }
        };
    }
    
    public Converter<String, Payment> ApplicationConversionServiceFactoryBean.getStringToPaymentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Payment>() {
            public net.eyelock.sakila.domain.Payment convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Payment.class);
            }
        };
    }
    
    public Converter<Rental, String> ApplicationConversionServiceFactoryBean.getRentalToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Rental, java.lang.String>() {
            public String convert(Rental rental) {
                return new StringBuilder().append(rental.getRentalDate()).append(' ').append(rental.getReturnDate()).append(' ').append(rental.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Integer, Rental> ApplicationConversionServiceFactoryBean.getIdToRentalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Integer, net.eyelock.sakila.domain.Rental>() {
            public net.eyelock.sakila.domain.Rental convert(java.lang.Integer id) {
                return rentalService.findRental(id);
            }
        };
    }
    
    public Converter<String, Rental> ApplicationConversionServiceFactoryBean.getStringToRentalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Rental>() {
            public net.eyelock.sakila.domain.Rental convert(String id) {
                return getObject().convert(getObject().convert(id, Integer.class), Rental.class);
            }
        };
    }
    
    public Converter<Staff, String> ApplicationConversionServiceFactoryBean.getStaffToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Staff, java.lang.String>() {
            public String convert(Staff staff) {
                return new StringBuilder().append(staff.getFirstName()).append(' ').append(staff.getLastName()).append(' ').append(staff.getEmail()).append(' ').append(staff.getUsername()).toString();
            }
        };
    }
    
    public Converter<Short, Staff> ApplicationConversionServiceFactoryBean.getIdToStaffConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Staff>() {
            public net.eyelock.sakila.domain.Staff convert(java.lang.Short id) {
                return staffService.findStaff(id);
            }
        };
    }
    
    public Converter<String, Staff> ApplicationConversionServiceFactoryBean.getStringToStaffConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Staff>() {
            public net.eyelock.sakila.domain.Staff convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Staff.class);
            }
        };
    }
    
    public Converter<Store, String> ApplicationConversionServiceFactoryBean.getStoreToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.Store, java.lang.String>() {
            public String convert(Store store) {
                return new StringBuilder().append(store.getLastUpdate()).toString();
            }
        };
    }
    
    public Converter<Short, Store> ApplicationConversionServiceFactoryBean.getIdToStoreConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Short, net.eyelock.sakila.domain.Store>() {
            public net.eyelock.sakila.domain.Store convert(java.lang.Short id) {
                return storeService.findStore(id);
            }
        };
    }
    
    public Converter<String, Store> ApplicationConversionServiceFactoryBean.getStringToStoreConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.Store>() {
            public net.eyelock.sakila.domain.Store convert(String id) {
                return getObject().convert(getObject().convert(id, Short.class), Store.class);
            }
        };
    }
    
    public Converter<String, FilmCategoryPK> ApplicationConversionServiceFactoryBean.getJsonToFilmCategoryPKConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.FilmCategoryPK>() {
            public FilmCategoryPK convert(String encodedJson) {
                return FilmCategoryPK.fromJsonToFilmCategoryPK(new String(Base64.decodeBase64(encodedJson)));
            }
        };
    }
    
    public Converter<FilmCategoryPK, String> ApplicationConversionServiceFactoryBean.getFilmCategoryPKToJsonConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmCategoryPK, java.lang.String>() {
            public String convert(FilmCategoryPK filmCategoryPK) {
                return Base64.encodeBase64URLSafeString(filmCategoryPK.toJson().getBytes());
            }
        };
    }
    
    public Converter<String, FilmActorPK> ApplicationConversionServiceFactoryBean.getJsonToFilmActorPKConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, net.eyelock.sakila.domain.FilmActorPK>() {
            public FilmActorPK convert(String encodedJson) {
                return FilmActorPK.fromJsonToFilmActorPK(new String(Base64.decodeBase64(encodedJson)));
            }
        };
    }
    
    public Converter<FilmActorPK, String> ApplicationConversionServiceFactoryBean.getFilmActorPKToJsonConverter() {
        return new org.springframework.core.convert.converter.Converter<net.eyelock.sakila.domain.FilmActorPK, java.lang.String>() {
            public String convert(FilmActorPK filmActorPK) {
                return Base64.encodeBase64URLSafeString(filmActorPK.toJson().getBytes());
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getActorToStringConverter());
        registry.addConverter(getIdToActorConverter());
        registry.addConverter(getStringToActorConverter());
        registry.addConverter(getAddressToStringConverter());
        registry.addConverter(getIdToAddressConverter());
        registry.addConverter(getStringToAddressConverter());
        registry.addConverter(getCategoryToStringConverter());
        registry.addConverter(getIdToCategoryConverter());
        registry.addConverter(getStringToCategoryConverter());
        registry.addConverter(getCityToStringConverter());
        registry.addConverter(getIdToCityConverter());
        registry.addConverter(getStringToCityConverter());
        registry.addConverter(getCountryToStringConverter());
        registry.addConverter(getIdToCountryConverter());
        registry.addConverter(getStringToCountryConverter());
        registry.addConverter(getCustomerToStringConverter());
        registry.addConverter(getIdToCustomerConverter());
        registry.addConverter(getStringToCustomerConverter());
        registry.addConverter(getFilmToStringConverter());
        registry.addConverter(getIdToFilmConverter());
        registry.addConverter(getStringToFilmConverter());
        registry.addConverter(getFilmActorToStringConverter());
        registry.addConverter(getIdToFilmActorConverter());
        registry.addConverter(getStringToFilmActorConverter());
        registry.addConverter(getFilmCategoryToStringConverter());
        registry.addConverter(getIdToFilmCategoryConverter());
        registry.addConverter(getStringToFilmCategoryConverter());
        registry.addConverter(getFilmTextToStringConverter());
        registry.addConverter(getIdToFilmTextConverter());
        registry.addConverter(getStringToFilmTextConverter());
        registry.addConverter(getInventoryToStringConverter());
        registry.addConverter(getIdToInventoryConverter());
        registry.addConverter(getStringToInventoryConverter());
        registry.addConverter(getLanguageToStringConverter());
        registry.addConverter(getIdToLanguageConverter());
        registry.addConverter(getStringToLanguageConverter());
        registry.addConverter(getPaymentToStringConverter());
        registry.addConverter(getIdToPaymentConverter());
        registry.addConverter(getStringToPaymentConverter());
        registry.addConverter(getRentalToStringConverter());
        registry.addConverter(getIdToRentalConverter());
        registry.addConverter(getStringToRentalConverter());
        registry.addConverter(getStaffToStringConverter());
        registry.addConverter(getIdToStaffConverter());
        registry.addConverter(getStringToStaffConverter());
        registry.addConverter(getStoreToStringConverter());
        registry.addConverter(getIdToStoreConverter());
        registry.addConverter(getStringToStoreConverter());
        registry.addConverter(getJsonToFilmCategoryPKConverter());
        registry.addConverter(getFilmCategoryPKToJsonConverter());
        registry.addConverter(getJsonToFilmActorPKConverter());
        registry.addConverter(getFilmActorPKToJsonConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
