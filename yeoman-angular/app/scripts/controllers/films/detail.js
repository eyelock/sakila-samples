'use strict';

angular.module('yeomanAngularApp')
  .controller('FilmsDetailCtrl', ['$scope', '$routeParams', 'Film', 'FilmCategories', 'FilmActors', function ($scope, $routeParams, Film, FilmCategories, FilmActors) {
      $scope.filmId = $routeParams.filmId;
	  $scope.film = Film.get({filmId:$scope.filmId});
      $scope.categories = FilmCategories.query({filmId:$scope.filmId});
      $scope.actors = FilmActors.query({filmId:$scope.filmId});
  }]);
