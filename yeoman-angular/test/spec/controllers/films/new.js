'use strict';

describe('Controller: FilmsNewCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var FilmsNewCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    FilmsNewCtrl = $controller('FilmsNewCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
