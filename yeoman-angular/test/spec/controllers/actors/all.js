'use strict';

describe('Controller: ActorsAllCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var ActorsAllCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ActorsAllCtrl = $controller('ActorsAllCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
