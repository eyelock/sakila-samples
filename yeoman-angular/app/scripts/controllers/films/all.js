'use strict';

angular.module('yeomanAngularApp')
  .controller('FilmsAllCtrl', ['$scope', 'FilmsPaged', function FilmsAllCtrl($scope, FilmsPaged) {
	  $scope.films = FilmsPaged.query({pageNumber: 1});
      
      $scope.onPaginate = function(pageNumber) {
          $scope.films = FilmsPaged.query({pageSize: $scope.films.pageSize, pageNumber: pageNumber});
      };
  }]);
