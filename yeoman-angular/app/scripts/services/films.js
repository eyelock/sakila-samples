'use strict';

angular.module('yeomanAngularApp')
  .service('Films', ['$resource', 'SERVICE_BASE_URL', function Films($resource, baseURL) {
	  return $resource(baseURL + '/films', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);


angular.module('yeomanAngularApp')
  .service('FilmsPaged', ['$resource', 'SERVICE_BASE_URL', function FilmsPaged($resource, baseURL) {
	  return $resource(baseURL + '/films/page/:pageNumber', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);


angular.module('yeomanAngularApp')
  .service('Film', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/films/:filmId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);

angular.module('yeomanAngularApp')
  .service('FilmCategories', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/films/:filmId/categories', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);

angular.module('yeomanAngularApp')
  .service('FilmActors', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/films/:filmId/actors', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);
