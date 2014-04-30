'use strict';

angular.module('yeomanAngularApp')
  .service('Rentals', function Rentals() {
    // AngularJS will instantiate a singleton by calling "new" on this function
  });


 angular.module('yeomanAngularApp')
  .service('RentalStores', ['$resource', 'SERVICE_BASE_URL', function RentalStores($resource, baseURL) {
 	  return $resource(baseURL + '/rentals/stores/:storeId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]); 
