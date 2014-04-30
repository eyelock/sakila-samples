'use strict';

describe('Controller: RentalsAllCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var RentalsAllCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    RentalsAllCtrl = $controller('RentalsAllCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
