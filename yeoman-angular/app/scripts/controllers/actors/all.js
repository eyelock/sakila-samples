'use strict';

angular.module('yeomanAngularApp')
  .controller('ActorsAllCtrl', ['$scope', 'Actors', function ($scope, Actors) {
    $scope.actors = Actors.query();
  }]);
