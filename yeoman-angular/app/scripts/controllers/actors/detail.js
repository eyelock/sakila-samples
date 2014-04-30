'use strict';

angular.module('yeomanAngularApp')
  .controller('ActorsDetailCtrl', ['$scope', '$routeParams', 'Actor', 'ActorFilms', function ($scope, $routeParams, Actor, ActorFilms) {
      $scope.actorId = $routeParams.actorId;
	  $scope.actor = Actor.get({actorId:$scope.actorId});
      $scope.films = ActorFilms.query({actorId:$scope.actorId});
  }]);
