'use strict';

angular.module('yeomanAngularApp')
  .controller('StoresCustomersCtrl', ['$scope', '$routeParams', 'Store', 'StoreCustomersPaged', function ($scope, $routeParams, Store, StoreCustomersPaged) {
    $scope.storeId = $routeParams.storeId;
    $scope.store = Store.get({storeId: $scope.storeId});                                   
    $scope.customers = StoreCustomersPaged.query({storeId: $scope.storeId, pageNumber: 1});
    $scope.jumbotron = {heading: '', lead: ''};
      
    $scope.store.$promise.then(function(result) {
        $scope.jumbotron.heading = $scope.store.addressId.cityId.city + ', ' + $scope.store.addressId.cityId.countryId.country;
        $scope.jumbotron.lead = 'Phone: ' + $scope.store.addressId.phone;
    });

    $scope.onPaginate = function(pageNumber) {
        $scope.customers = StoreCustomersPaged.query({storeId: $scope.storeId, pageSize: $scope.customers.pageSize, pageNumber: pageNumber});
    };
}]);
