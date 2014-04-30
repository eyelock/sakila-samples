'use strict';

describe('Controller: RentalsCustomerCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var RentalsCustomerCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    RentalsCustomerCtrl = $controller('RentalsCustomerCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
