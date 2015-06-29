#= require spec_helper

describe 'Filters', ->
  describe 'CMaskContacts', ->
    beforeEach ->
      @maskFilter = @filter('cMaskContacts')

    it 'should mask the value with asterisks', ->
      @value = "123"
      @nonMaskLength = 0

      expect(@maskFilter(@value, @nonMaskLength)).toEqual "***"