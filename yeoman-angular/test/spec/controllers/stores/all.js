'use strict';

describe('Controller: StoresAllCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var StoresAllCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    StoresAllCtrl = $controller('StoresAllCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
