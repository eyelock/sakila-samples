'use strict';

describe('Controller: StoresFilmsCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var StoresFilmsCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    StoresFilmsCtrl = $controller('StoresFilmsCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
