'use strict';

describe('Controller: FilmsSearchCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var FilmsSearchCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    FilmsSearchCtrl = $controller('FilmsSearchCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
