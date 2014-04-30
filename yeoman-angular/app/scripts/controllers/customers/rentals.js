'use strict';

angular.module('yeomanAngularApp')
  .controller('CustomersRentalsCtrl', ['$scope', '$routeParams', 'Customer', 'CustomerRentals', function ($scope, $routeParams, Customer, CustomerRentals) {
      $scope.customerId = $routeParams.customerId;
	  $scope.customer = Customer.get({customerId:$scope.customerId});
      $scope.rentals = CustomerRentals.query({customerId:$scope.customerId});
  }]);
