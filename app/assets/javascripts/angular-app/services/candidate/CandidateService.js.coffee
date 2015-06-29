angular.module('app.candidateApp')
  .factory('CandidateService', [
      'Restangular', 'Candidate',
      (Restangular, Candidate)->

        model = 'candidates'

        Restangular.extendModel(model, (obj)->
          angular.extend(obj, Candidate)
        )

        list: ()     -> Restangular.all(model).getList()
        new: ()      -> Restangular.one(model)
      ])