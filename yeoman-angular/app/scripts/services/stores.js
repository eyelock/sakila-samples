'use strict';

angular.module('yeomanAngularApp')
  .service('Stores', ['$resource', 'SERVICE_BASE_URL', function Categories($resource, baseURL) {
	  return $resource(baseURL + '/stores', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);

 angular.module('yeomanAngularApp')
  .service('Store', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 


 angular.module('yeomanAngularApp')
  .service('StoreCustomers', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId/customers', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 

 angular.module('yeomanAngularApp')
  .service('StoreFilms', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/stores/:storeId/films', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 
