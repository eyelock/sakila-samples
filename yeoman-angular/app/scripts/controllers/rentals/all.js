'use strict';

angular.module('yeomanAngularApp')
  .controller('RentalsAllCtrl', ['$scope', 'RentalsPaged', function FilmsAllCtrl($scope, RentalsPaged) {
	  $scope.rentals = RentalsPaged.query({pageNumber: 1});
      
      $scope.onPaginate = function(pageNumber) {
          $scope.rentals = RentalsPaged.query({pageSize: $scope.rentals.pageSize, pageNumber: pageNumber});
      };
  }]);
