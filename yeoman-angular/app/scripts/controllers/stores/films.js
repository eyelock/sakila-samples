'use strict';

angular.module('yeomanAngularApp')
    .controller('StoresFilmsCtrl', ['$scope', '$routeParams', 'Store', 'StoreFilms', function ($scope, $routeParams, Store, StoreFilms) {
        $scope.storeId = $routeParams.storeId;
	    $scope.store = Store.get({storeId: $scope.storeId});                                   
        $scope.films = StoreFilms.query({storeId: $scope.storeId});
    }]);
