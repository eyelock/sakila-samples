'use strict';

angular.module('yeomanAngularApp')
  .controller('AlertsPageCtrl', ['$scope', 'Alerts', function ($scope, Alerts) {
      $scope.alerts = Alerts.get();
      $scope.model = Alerts;
      
      $scope.closeAlert = function(index) {
          $scope.model.remove(index);
      };
}]);
