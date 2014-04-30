'use strict';

describe('Controller: CategoriesAllCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanAngularApp'));

  var CategoriesAllCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    CategoriesAllCtrl = $controller('CategoriesAllCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
