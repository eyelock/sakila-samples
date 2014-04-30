'use strict';

describe('Service: Actors', function () {

  // load the service's module
  beforeEach(module('yeomanAngularApp'));

  // instantiate service
  var Actors;
  beforeEach(inject(function (_Actors_) {
    Actors = _Actors_;
  }));

  it('should do something', function () {
    expect(!!Actors).toBe(true);
  });

});
