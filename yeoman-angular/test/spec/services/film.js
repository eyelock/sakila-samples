'use strict';

describe('Service: Film', function () {

  // load the service's module
  beforeEach(module('yeomanAngularApp'));

  // instantiate service
  var Film;
  beforeEach(inject(function (_Film_) {
    Film = _Film_;
  }));

  it('should do something', function () {
    expect(!!Film).toBe(true);
  });

});
