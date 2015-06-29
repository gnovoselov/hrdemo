angular.module('app.candidateApp').controller('CandidateFormModalCtrl', [
  '$scope', '$modalInstance', 'candidate', ($scope, $modalInstance, candidate)->

    $scope.form = {}
    $scope.candidate = candidate

    $scope.errorClass = (name) ->
      s = $scope.form.candidate[name]
      s.$invalid && s.$dirty ? "error" : ""

    $scope.errorMessage = (name) ->
      result = []
      _.each $scope.form.candidate[name].$error, (key, value) ->
        result.push value
      result.join ', '

    $scope.submitCandidate = ->
      $($scope.form).find('input.ng-invalid').removeClass('ng-invalid')
      $($scope.form).find('.error').removeClass('error')
      if candidate.id > 0
        candidate.put().then (->
          $modalInstance.close('saved')
        ), (response) ->
          _.each response.data, (errors, key) ->
            _.each errors, (e) ->
              $scope.form.candidate[key].$dirty = true
              $scope.form.candidate[key].$setValidity(e, false)
      else
        candidate.post().then (->

          $modalInstance.close('saved')
        ), (response) ->
          _.each response.data, (errors, key) ->
            _.each errors, (e) ->
              $scope.form.candidate[key].$dirty = true
              $scope.form.candidate[key].$setValidity(e, false)

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

])