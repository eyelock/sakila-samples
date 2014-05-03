'use strict';

angular.module('yeomanAngularApp')
    .controller('StoresDetailCtrl', ['$scope', '$routeParams', 'Store', function ($scope, $routeParams, Store) {
        $scope.storeId = $routeParams.storeId;
	    $scope.store = Store.get({storeId: $scope.storeId});
        $scope.jumbotron = {heading: '', lead: ''};
        
        $scope.store.$promise.then(function(result) {
            $scope.jumbotron.heading = $scope.store.addressId.cityId.city + ', ' + $scope.store.addressId.cityId.countryId.country;
            $scope.jumbotron.lead = 'Phone: ' + $scope.store.addressId.phone;
            
            $scope.address = $scope.store.addressId;
            $scope.staff = $scope.store.managerStaffId;
        });
    }]);