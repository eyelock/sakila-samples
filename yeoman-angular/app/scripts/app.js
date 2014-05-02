'use strict';


angular
  .module('yeomanAngularApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'ui.bootstrap'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/films/new', {
        templateUrl: 'views/films/new.html',
        controller: 'FilmsNewCtrl'
      })
      .when('/films/all', {
        templateUrl: 'views/films/all.html',
        controller: 'FilmsAllCtrl'
      })
      .when('/films/:filmId', {
        templateUrl: 'views/films/detail.html',
        controller: 'FilmsDetailCtrl'
      })
      .when('/categories/all', {
        templateUrl: 'views/categories/all.html',
        controller: 'CategoriesAllCtrl'
      })
      .when('/categories/:categoryId', {
        templateUrl: 'views/categories/detail.html',
        controller: 'CategoriesDetailCtrl'
      })
      .when('/actors/all', {
        templateUrl: 'views/actors/all.html',
        controller: 'ActorsAllCtrl'
      })
      .when('/actors/:actorId', {
        templateUrl: 'views/actors/detail.html',
        controller: 'ActorsDetailCtrl'
      })
      .when('/authenticate/login', {
        templateUrl: 'views/authenticate/login.html',
        controller: 'AuthenticateLoginCtrl'
      })
      .when('/authenticate/register', {
        templateUrl: 'views/authenticate/register.html',
        controller: 'AuthenticateRegisterCtrl'
      })
      .when('/authenticate/logout', {
        templateUrl: 'views/authenticate/logout.html',
        controller: 'AuthenticateLogoutCtrl'
      })
      .when('/stores/all', {
        templateUrl: 'views/stores/all.html',
        controller: 'StoresAllCtrl'
      })
      .when('/stores/:storeId', {
        templateUrl: 'views/stores/detail.html',
        controller: 'StoresDetailCtrl'
      })
      .when('/stores/:storeId/films', {
        templateUrl: 'views/stores/films.html',
        controller: 'StoresFilmsCtrl'
      })
      .when('/stores/:storeId/customers', {
        templateUrl: 'views/stores/customers.html',
        controller: 'StoresCustomersCtrl'
      })
      .when('/stores/:storeId/rentals', {
        templateUrl: 'views/stores/rentals.html',
        controller: 'StoreRentalsCtrl'
      })
      .when('/rentals/all', {
        templateUrl: 'views/rentals/all.html',
        controller: 'RentalsAllCtrl'
      })
      .when('/rentals/:rentalId', {
        templateUrl: 'views/rentals/detail.html',
        controller: 'RentalsDetailCtrl'
      })
      .when('/rentals/films/:filmId', {
        templateUrl: 'views/rentals/films.html',
        controller: 'RentalsFilmsCtrl'
      })
      .when('/rentals/stores/:storeId', {
        templateUrl: 'views/rentals/stores.html',
        controller: 'RentalsStoresCtrl'
      })
      .when('/rentals/customers/:customerId', {
        templateUrl: 'views/rentals/customers.html',
        controller: 'RentalsCustomersCtrl'
      })
      .when('/customers/all', {
        templateUrl: 'views/customers/all.html',
        controller: 'CustomersAllCtrl'
      })
      .when('/customers/:customerId', {
        templateUrl: 'views/customers/detail.html',
        controller: 'CustomersDetailCtrl'
      })
      .when('/customers/:customerId/rentals', {
        templateUrl: 'views/customers/rentals.html',
        controller: 'CustomersRentalsCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  })
  .constant('SERVICE_BASE_URL', 'http://localhost:8080/sakila')
  .directive('sakilaFilmsTable', function() {      
    return {
      scope: {
          items: '=sakilaFilmsTable',
          onPaginate: '&'
      },
      link: function(scope, element, attrs) {
        //TODO this is bad practice reaching out to parent scope, but can't currently get the method reference passing through the isolated scopes
        scope.onPaginate = scope.$parent.onPaginate;
      },
      restrict: 'EA',
      templateUrl: 'views/partials/films-table.html'
    };  
  })
  .directive('sakilaCustomersTable', function() {
    return {
      scope: {
          items: '=sakilaCustomersTable',
          onPaginate: '&'
      },
      link: function(scope, element, attrs) {
        //TODO this is bad practice reaching out to parent scope, but can't currently get the method reference passing through the isolated scopes
        scope.onPaginate = scope.$parent.onPaginate;
      },
      restrict: 'EA',
      templateUrl: 'views/partials/customers-table.html'
    };  
  })
  .directive('sakilaRentalsTable', function() {
    return {
      scope: {
          items: '=sakilaRentalsTable',
          onPaginate: '&'
      },
      link: function(scope, element, attrs) {
        //TODO this is bad practice reaching out to parent scope, but can't currently get the method reference passing through the isolated scopes
        scope.onPaginate = scope.$parent.onPaginate;
      },
      restrict: 'EA',
      templateUrl: 'views/partials/rentals-table.html'
    };  
  })
  .directive('sakilaStoreJumbotron', function() {
    return {
      scope: {
          item: '=sakilaStoreJumbotron'
      },
      restrict: 'EA',
      templateUrl: 'views/partials/store-jumbotron.html'
    };  
  })
  .directive('sakilaStaffDl', function() {
    return {
      scope: {
          item: '=sakilaStaffDl'
      },
      restrict: 'EA',
      templateUrl: 'views/partials/staff-dl.html'
    };  
  })
  .directive('sakilaAddressDl', function() {
    return {
      scope: {
          item: '=sakilaAddressDl'
      },
      restrict: 'EA',
      templateUrl: 'views/partials/address-dl.html'
    };  
  });