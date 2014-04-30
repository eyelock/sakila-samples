'use strict';

angular.module('yeomanAngularApp')
  .service('Customers', ['$resource', 'SERVICE_BASE_URL', function Customers($resource, baseURL) {
	  return $resource(baseURL + '/customers', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);

angular.module('yeomanAngularApp')
  .service('Customer', ['$resource', 'SERVICE_BASE_URL', function Customer($resource, baseURL) {
 	  return $resource(baseURL + '/customers/:customerId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);

angular.module('yeomanAngularApp')
  .service('CustomerRentals', ['$resource', 'SERVICE_BASE_URL', function CustomerRentals($resource, baseURL) {
 	  return $resource(baseURL + '/customers/:customerId/rentals', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);
