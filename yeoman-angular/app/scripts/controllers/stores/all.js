'use strict';

angular.module('yeomanAngularApp')
  .controller('StoresAllCtrl', ['$scope', 'Stores', function ($scope, Stores) {
    $scope.stores = Stores.query();
  }]);
