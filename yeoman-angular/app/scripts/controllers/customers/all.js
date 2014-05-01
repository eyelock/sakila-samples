'use strict';

angular.module('yeomanAngularApp')
  .controller('CustomersAllCtrl', ['$scope', 'CustomersPaged', function ($scope, CustomersPaged) {
	  $scope.customers = CustomersPaged.query({pageNumber: 1});
      var pageSize = $scope.customers.pageSize;
      
      $scope.onPaginate = function(pageNumber) {
          $scope.customers = CustomersPaged.query({pageSize: pageSize, pageNumber: pageNumber});
      };
  }]);
