angular.module('app.candidateApp').filter('booleanCheck', ()->
  (value) ->
    if value == true
      '✓'
    else
      ''
)