'use strict';

describe('Controller: CustomersRentalsCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var CustomersRentalsCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    CustomersRentalsCtrl = $controller('CustomersRentalsCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
