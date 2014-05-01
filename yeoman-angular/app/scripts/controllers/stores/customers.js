'use strict';

angular.module('yeomanAngularApp')
  .controller('StoresCustomersCtrl', ['$scope', '$routeParams', 'Store', 'StoreCustomersPaged', function ($scope, $routeParams, Store, StoreCustomersPaged) {
    $scope.storeId = $routeParams.storeId;
    $scope.store = Store.get({storeId: $scope.storeId});                                   
    $scope.customers = StoreCustomersPaged.query({storeId: $scope.storeId, pageNumber: 1});

    $scope.onPaginate = function(pageNumber) {
        $scope.customers = StoreCustomersPaged.query({storeId: $scope.storeId, pageSize: $scope.customers.pageSize, pageNumber: pageNumber});
    };
}]);
