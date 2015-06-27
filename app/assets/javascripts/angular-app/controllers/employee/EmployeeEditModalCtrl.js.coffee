angular.module('app.employeeApp').controller('EmployeeEditModalCtrl', [
  '$scope', '$modalInstance', 'employee', ($scope, $modalInstance, employee)->

    $scope.form = {}
    $scope.employee = employee

    $scope.errorClass = (name) ->
      s = $scope.form.employee[name]
      s.$invalid && s.$dirty ? "error" : ""

    $scope.errorMessage = (name) ->
      result = []
      _.each $scope.form.employee[name].$error, (key, value) ->
        result.push value
      result.join ', '

    $scope.submitEmployee = ->
      employee.put().then (->
        $modalInstance.close('saved')
      ), (response) ->
        _.each response.data, (errors, key) ->
          _.each errors, (e) ->
            $scope.form.employee[key].$dirty = true
            $scope.form.employee[key].$setValidity(e, false)

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

])