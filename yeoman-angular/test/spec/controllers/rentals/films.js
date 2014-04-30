'use strict';

describe('Controller: RentalsFilmsCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var RentalsFilmsCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    RentalsFilmsCtrl = $controller('RentalsFilmsCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
