'use strict';

describe('Controller: RentalsStoresCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var RentalsStoresCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    RentalsStoresCtrl = $controller('RentalsStoresCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
