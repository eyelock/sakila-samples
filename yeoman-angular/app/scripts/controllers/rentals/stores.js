'use strict';

angular.module('yeomanAngularApp')
  .controller('RentalsStoresCtrl', ['$scope', '$routeParams', 'Store', 'RentalStores', function ($scope, $routeParams, Store, RentalStores) {
        $scope.storeId = $routeParams.storeId;
	    $scope.store = Store.get({storeId: $scope.storeId});                                   
        $scope.rentals = RentalStores.query({storeId: $scope.storeId});
    }]);
