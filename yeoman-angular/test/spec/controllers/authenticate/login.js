'use strict';

describe('Controller: AuthenticateLoginCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var AuthenticateLoginCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AuthenticateLoginCtrl = $controller('AuthenticateLoginCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
