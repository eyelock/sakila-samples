'use strict';

describe('Controller: FilmsDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var FilmsDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    FilmsDetailCtrl = $controller('FilmsDetailCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
