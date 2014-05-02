'use strict';

angular.module('yeomanAngularApp')
  .service('Stores', ['$resource', 'SERVICE_BASE_URL', function Stores($resource, baseURL) {
	  return $resource(baseURL + '/stores', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);

 angular.module('yeomanAngularApp')
  .service('Store', ['$resource', 'SERVICE_BASE_URL', function Store($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 


 angular.module('yeomanAngularApp')
  .service('StoreCustomers', ['$resource', 'SERVICE_BASE_URL', function StoreCustomers($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId/customers', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 

 angular.module('yeomanAngularApp')
  .service('StoreCustomersPaged', ['$resource', 'SERVICE_BASE_URL', function StoreCustomersPaged($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId/customers/page/:pageNumber', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);

 angular.module('yeomanAngularApp')
  .service('StoreFilms', ['$resource', 'SERVICE_BASE_URL', function StoreFilms($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId/films', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 

 angular.module('yeomanAngularApp')
  .service('StoreRentalsPaged', ['$resource', 'SERVICE_BASE_URL', function StoreRentalsPaged($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId/rentals/page/:pageNumber', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 
