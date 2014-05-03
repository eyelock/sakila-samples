'use strict';

angular.module('yeomanAngularApp')
  .controller('CustomersDetailCtrl', ['$scope', '$routeParams', 'Customer', 'FilmCategories', 'FilmActors', function ($scope, $routeParams, Customer) {
    $scope.customerId = $routeParams.customerId;
    $scope.customer = Customer.get({customerId:$scope.customerId});
      
    $scope.jumbotron = {heading: ''};

    $scope.customer.$promise.then(function(result) {
        $scope.jumbotron.heading = $scope.customer.firstName + ' ' + $scope.customer.lastName;
        $scope.address = $scope.customer.addressId;
    });
}]);
