'use strict';

describe('Controller: AuthenticateLogoutCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var AuthenticateLogoutCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AuthenticateLogoutCtrl = $controller('AuthenticateLogoutCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
