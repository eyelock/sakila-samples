'use strict';

angular.module('yeomanAngularApp')
  .service('Categories', ['$resource', 'SERVICE_BASE_URL', function Categories($resource, baseURL) {
	  return $resource(baseURL + '/categories', {}, {
	      query: {method:'GET', isArray:false}
	    });
  }]);
                          
 angular.module('yeomanAngularApp')
  .service('Category', ['$resource', 'SERVICE_BASE_URL', function Film($resource, baseURL) {
 	  return $resource(baseURL + '/categories/:categoryId', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);                         
                          
angular.module('yeomanAngularApp')
  .service('CategoryFilms', ['$resource', 'SERVICE_BASE_URL', function CategoryFilms($resource, baseURL) {
 	  return $resource(baseURL + '/categories/:categoryId/films', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);

angular.module('yeomanAngularApp')
  .service('CategoryFilmsPaged', ['$resource', 'SERVICE_BASE_URL', function CategoryFilmsPaged($resource, baseURL) {
 	  return $resource(baseURL + '/categories/:categoryId/films/page/:pageNumber', {}, {
        query: {method:'GET', isArray:false}   
      });
  }]);