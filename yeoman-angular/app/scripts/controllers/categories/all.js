'use strict';

angular.module('yeomanAngularApp')
  .controller('CategoriesAllCtrl', ['$scope', 'Categories', function ($scope, Categories) {
    $scope.categories = Categories.query();
  }]);
