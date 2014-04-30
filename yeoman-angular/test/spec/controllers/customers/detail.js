'use strict';

describe('Controller: CustomersDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var CustomersDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    CustomersDetailCtrl = $controller('CustomersDetailCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
