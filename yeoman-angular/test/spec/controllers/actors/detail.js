'use strict';

describe('Controller: ActorsDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var ActorsDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ActorsDetailCtrl = $controller('ActorsDetailCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
