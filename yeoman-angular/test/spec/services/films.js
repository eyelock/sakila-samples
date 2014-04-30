'use strict';

describe('Service: Films', function () {

  // load the service's module
  beforeEach(module('yeomanAngularApp'));

  // instantiate service
  var Films;
  beforeEach(inject(function (_Films_) {
    Films = _Films_;
  }));

  it('should do something', function () {
    expect(!!Films).toBe(true);
  });

});
