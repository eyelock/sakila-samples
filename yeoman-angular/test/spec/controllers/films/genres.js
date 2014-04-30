'use strict';

describe('Controller: FilmsGenresCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var FilmsGenresCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    FilmsGenresCtrl = $controller('FilmsGenresCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
