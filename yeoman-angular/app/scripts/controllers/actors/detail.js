'use strict';

angular.module('yeomanAngularApp')
  .controller('ActorsDetailCtrl', ['$scope', '$routeParams', 'Actor', 'ActorFilmsPaged', function ($scope, $routeParams, Actor, ActorFilmsPaged) {
    $scope.actorId = $routeParams.actorId;
    $scope.actor = Actor.get({actorId:$scope.actorId});
    $scope.films = ActorFilmsPaged.query({actorId:$scope.actorId, pageNumber:1});
      
    $scope.jumbotron = {heading: ''};
      
    $scope.actor.$promise.then(function(result) {
        $scope.jumbotron.heading = $scope.actor.firstName + ' ' + $scope.actor.lastName;
    });
      
    $scope.onPaginate = function(pageNumber) {
      $scope.films = ActorFilmsPaged.query({pageSize: $scope.films.pageSize, pageNumber: pageNumber});
    };
}]);
