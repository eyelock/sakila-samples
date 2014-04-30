'use strict';

angular.module('yeomanAngularApp')
  .controller('CustomersAllCtrl', ['$scope', 'Customers', function ($scope, Customers) {
	  $scope.customers = Customers.query();
      
      $scope.paginateResults = function(pageNumber) {
        alert(pageNumber);  
      };
  }]);
