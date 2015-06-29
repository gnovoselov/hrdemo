angular.module('app.candidateApp').controller("CandidateListCtrl", [
  '$scope', 'CandidateService', '$modal',
  ($scope, CandidateService, $modal)->

    $scope.createCandidate = () ->
      candidate = CandidateService.new()
      $scope.candidates.push candidate
      modalInstance = $modal.open({
        templateUrl: 'candidates/new.html',
        controller: 'CandidateFormModalCtrl'
        size: 'lg'
        resolve:
          candidate: ->
            candidate
      })

      modalInstance.result.then(->
#        console.log 'edit closed'
      )

    $scope.editCandidate = (candidate) ->
      console.log candidate
      modalInstance = $modal.open({
        templateUrl: 'candidates/edit.html',
        controller: 'CandidateFormModalCtrl'
        size: 'lg'
        resolve:
          candidate: ->
            candidate
      })

      modalInstance.result.then(->
#        console.log 'edit closed'
      )

    CandidateService.list().then((candidates) ->
      $scope.candidates = candidates
#      console.dir candidates
    )
])