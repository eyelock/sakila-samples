'use strict';

describe('Controller: CustomersAllCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var CustomersAllCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    CustomersAllCtrl = $controller('CustomersAllCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
