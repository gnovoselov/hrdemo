require 'rails_helper'

describe Api::CandidatesController do
  before(:each) do
    @candidate = create(:candidates, name: 'Васильев Василий Иванович', salary: 50000)
  end

  describe '#index' do
    it 'should return a json array of users' do
      get :index
      result = JSON.parse(response.body)

      expect(result[0]['name']).to eq('Васильев Василий Иванович')
    end
  end

  describe '#update' do
    it 'should successfully respond to edits' do
      put :update, id: @candidate.id, candidates: {
                     id: @candidate.id,
                     salary: 60000
                 }

      expect(response).to be_success
    end

    it "should change the candidate's salary" do
      @candidate.update_attribute(:salary, 50000)

      put :update, id: @candidate.id, candidates: {
                     id: @candidate.id,
                     salary: 60000
                 }

      expect(@candidate.reload.salary).to eq(60000)
    end
  end
end