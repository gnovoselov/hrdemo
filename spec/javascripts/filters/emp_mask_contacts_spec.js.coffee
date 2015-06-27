#= require spec_helper

describe 'Filters', ->
  describe 'EmpMaskContacts', ->
    beforeEach ->
      @maskFilter = @filter('empMaskContacts')

    it 'should mask the value with asterisks', ->
      @value = "123"
      @nonMaskLength = 0

      expect(@maskFilter(@value, @nonMaskLength)).toEqual "***"