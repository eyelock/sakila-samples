'use strict';

angular.module('yeomanAngularApp')
  .service('Rentals', ['$resource', 'SERVICE_BASE_URL', , function Rentals($resource, baseURL) {
 	  return $resource(baseURL + '/rentals', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);

angular.module('yeomanAngularApp')
  .service('RentalsPaged', ['$resource', 'SERVICE_BASE_URL', function RentalsPaged($resource, baseURL) {
	  return $resource(baseURL + '/rentals/page/:pageNumber', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);



 angular.module('yeomanAngularApp')
  .service('RentalStores', ['$resource', 'SERVICE_BASE_URL', function RentalStores($resource, baseURL) {
 	  return $resource(baseURL + '/rentals/stores/:storeId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 
