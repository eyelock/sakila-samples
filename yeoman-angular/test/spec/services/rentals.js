'use strict';

describe('Service: Rentals', function () {

  // load the service's module
  beforeEach(module('yeomanAngularApp'));

  // instantiate service
  var Rentals;
  beforeEach(inject(function (_Rentals_) {
    Rentals = _Rentals_;
  }));

  it('should do something', function () {
    expect(!!Rentals).toBe(true);
  });

});
