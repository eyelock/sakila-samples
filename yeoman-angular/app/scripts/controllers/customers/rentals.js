'use strict';

angular.module('yeomanAngularApp')
  .controller('CustomersRentalsCtrl', ['$scope', '$routeParams', 'Customer', 'CustomerRentalsPaged', function ($scope, $routeParams, Customer, CustomerRentalsPaged) {
    $scope.customerId = $routeParams.customerId;
    $scope.customer = Customer.get({customerId:$scope.customerId});
    $scope.rentals = CustomerRentalsPaged.query({customerId:$scope.customerId, pageNumber: 1});
      
    $scope.jumbotron = {heading: ''};
      
    $scope.customer.$promise.then(function(result) {
        $scope.jumbotron.heading = $scope.customer.firstName + ' ' + $scope.customer.lastName;
    });

    $scope.onPaginate = function(pageNumber) {
        $scope.rentals = CustomerRentalsPaged.query({customerId: $scope.customerId, pageSize: $scope.rentals.pageSize, pageNumber: pageNumber});
    };
  }]);
