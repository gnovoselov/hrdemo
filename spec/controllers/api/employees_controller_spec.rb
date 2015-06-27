require 'rails_helper'

describe Api::EmployeesController do
  before(:each) do
    create(:employee, name: 'Васильев Василий Иванович')
  end

  describe '#index' do
    it 'should return a json array of users' do
      get :index
      result = JSON.parse(response.body)

      expect(result[0]['name']).to eq('Васильев Василий Иванович')
    end
  end
end