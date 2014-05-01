'use strict';

angular.module('yeomanAngularApp')
  .service('Actors', ['$resource', 'SERVICE_BASE_URL', function Actors($resource, baseURL) {
	  return $resource(baseURL + '/actors', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);

angular.module('yeomanAngularApp')
  .service('ActorsPaged', ['$resource', 'SERVICE_BASE_URL', function ActorsPaged($resource, baseURL) {
	  return $resource(baseURL + '/actors/page/:pageNumber', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);
                          
 angular.module('yeomanAngularApp')
  .service('Actor', ['$resource', 'SERVICE_BASE_URL', function Actor($resource, baseURL) {
 	  return $resource(baseURL + '/actors/:actorId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);                         
                          
angular.module('yeomanAngularApp')
  .service('ActorFilms', ['$resource', 'SERVICE_BASE_URL', function ActorFilms($resource, baseURL) {
 	  return $resource(baseURL + '/actors/:actorId/films', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);

angular.module('yeomanAngularApp')
  .service('ActorFilmsPaged', ['$resource', 'SERVICE_BASE_URL', function ActorFilmsPaged($resource, baseURL) {
 	  return $resource(baseURL + '/actors/:actorId/films/page/:pageNumber', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);
