'use strict';

describe('Controller: AlertsPageCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var AlertsPageCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AlertsPageCtrl = $controller('AlertsPageCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
