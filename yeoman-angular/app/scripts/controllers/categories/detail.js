'use strict';

angular.module('yeomanAngularApp')
  .controller('CategoriesDetailCtrl', ['$scope', '$routeParams', 'Category', 'CategoryFilms', function ($scope, $routeParams, Category, CategoryFilms) {
      $scope.categoryId = $routeParams.categoryId;
	  $scope.category = Category.get({categoryId:$scope.categoryId});
      $scope.films = CategoryFilms.query({categoryId:$scope.categoryId});
      
      $scope.pageRecords = function(pageNo) {
          alert('paginate' + pageNo);
      };
  }]);
