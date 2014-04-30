'use strict';

describe('Controller: RentalsCustomersCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var RentalsCustomersCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    RentalsCustomersCtrl = $controller('RentalsCustomersCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
