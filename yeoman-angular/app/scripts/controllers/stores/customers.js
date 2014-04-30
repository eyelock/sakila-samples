'use strict';

angular.module('yeomanAngularApp')
  .controller('StoresCustomersCtrl', ['$scope', '$routeParams', 'Store', 'StoreCustomers', function ($scope, $routeParams, Store, StoreCustomers) {
        $scope.storeId = $routeParams.storeId;
	    $scope.store = Store.get({storeId: $scope.storeId});                                   
        $scope.customers = StoreCustomers.query({storeId: $scope.storeId});
    }]);
