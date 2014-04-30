'use strict';

describe('Controller: StoresDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var StoresDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    StoresDetailCtrl = $controller('StoresDetailCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
