!function() {
  'use strict';

  var app = angular.module('app', []);

  app.service('socket', ['$rootScope', function($rootScope) {
    var connection;

    return {
      connect: function() {
        connection          = new WebSocket('ws://localhost:3000/ws/spaces/space');
        connection.onopen   = function(event) {
          console.log('open');
          connection.send(JSON.stringify({event: 'messages', space: 'space'}));
          connection.send(JSON.stringify({event: 'label',    space: 'space'}));
        }
        connection.onmessage  = function(event) {
          var message = JSON.parse(event.data);
          console.log('message', message);
          $rootScope.$broadcast('socket:' + message.event, message.data);
        }
      },
      sendMessage: function(what, from) {
        connection.send(JSON.stringify({
          event:  'message',
          what:   what,
          from:   from,
          space:  'space'
        }));
      }
    };
  }]);

  app.directive('space', ['socket', function(socket) {
    return {
      restrict: 'E',
      link: function(scope, iElement, iAttrs) {
        scope.label     = '';
        scope.messages  = [];

        scope.$on('socket:messages', function($event, data) {
          scope.$apply(function() {
            scope.messages = data.messages;
          });
        });

        scope.$on('socket:label', function($event, data) {
          scope.$apply(function() {
            scope.label = data.label;
          });
        });

        scope.$on('socket:message', function($event, data) {
          scope.$apply(function() {
            scope.messages.push(data);
          });
        });

        scope.sendMessage = function($event) {
          scope.messages.push(scope.newMessage);
          socket.sendMessage(scope.newMessage.what, scope.newMessage.from);
          scope.newMessage = undefined;
        }

        socket.connect();
      }
    }
  }]);
}();
