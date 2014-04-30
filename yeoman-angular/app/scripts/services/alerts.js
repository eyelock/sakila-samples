'use strict';

angular.module('yeomanAngularApp')
  .service('Alerts', function Alerts() {

      var alertStore = [];
      
      return {
          add: function(type, message) {
            alertStore.push({type: type, msg: message});
          },

          remove: function(index) {
            alertStore.splice(index, 1);
          },

          clear: function() {
            alertStore = []
          },

          get: function() {
            return alertStore;
          }
      };
  });
