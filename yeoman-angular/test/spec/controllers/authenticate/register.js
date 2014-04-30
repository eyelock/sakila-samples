'use strict';

describe('Controller: AuthenticateRegisterCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var AuthenticateRegisterCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AuthenticateRegisterCtrl = $controller('AuthenticateRegisterCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
