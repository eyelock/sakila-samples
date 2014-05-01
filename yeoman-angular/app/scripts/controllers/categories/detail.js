'use strict';

angular.module('yeomanAngularApp')
  .controller('CategoriesDetailCtrl', ['$scope', '$routeParams', 'Category', 'CategoryFilmsPaged', function ($scope, $routeParams, Category, CategoryFilmsPaged) {
      $scope.categoryId = $routeParams.categoryId;
	  $scope.category = Category.get({categoryId:$scope.categoryId});
      $scope.films = CategoryFilmsPaged.query({categoryId:$scope.categoryId, pageNumber: 1});
      
      $scope.onPaginate = function(pageNumber) {
          $scope.films = CategoryFilmsPaged.query({categoryId:$scope.categoryId, pageNumber: pageNumber});
      };
  }]);
