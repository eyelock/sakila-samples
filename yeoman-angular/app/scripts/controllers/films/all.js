'use strict';

angular.module('yeomanAngularApp')
  .controller('FilmsAllCtrl', ['$scope', 'Films', function ($scope, Films) {
	  $scope.films = Films.query();
      
      $scope.paginateResults = function(pageNumber) {
        alert(pageNumber);  
      };
  }]);
