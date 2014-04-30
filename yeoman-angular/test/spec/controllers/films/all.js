'use strict';

describe('Controller: FilmsAllCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var FilmsAllCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    FilmsAllCtrl = $controller('FilmsAllCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
