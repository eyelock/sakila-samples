'use strict';

angular.module('yeomanAngularApp')
    .controller('StoresFilmsCtrl', ['$scope', '$routeParams', 'Store', 'StoreFilms', function ($scope, $routeParams, Store, StoreFilms) {
    $scope.storeId = $routeParams.storeId;
    $scope.store = Store.get({storeId: $scope.storeId});                                   
    $scope.films = StoreFilms.query({storeId: $scope.storeId});
        
    $scope.jumbotron = {heading: '', lead: ''};
      
    $scope.store.$promise.then(function(result) {
        $scope.jumbotron.heading = $scope.store.addressId.cityId.city + ', ' + $scope.store.addressId.cityId.countryId.country;
        $scope.jumbotron.lead = 'Phone: ' + $scope.store.addressId.phone;
    });
}]);
