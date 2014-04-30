'use strict';

angular.module('yeomanAngularApp')
    .controller('StoresDetailCtrl', ['$scope', '$routeParams', 'Store', function ($scope, $routeParams, Store) {
        $scope.storeId = $routeParams.storeId;
	    $scope.store = Store.get({storeId: $scope.storeId});
        
        $scope.store.$promise.then(function(result) {
            $scope.address = $scope.store.addressId;
            $scope.staff = $scope.store.managerStaffId;
        });
    }]);