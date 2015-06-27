angular.module('app.hrdemoApp').controller("HrdemoCtrl", [
  '$scope',
  ($scope)->
    console.log 'HrdemoCtrl running'

    $scope.hrdemoValue = "Hello angular and rails"

])