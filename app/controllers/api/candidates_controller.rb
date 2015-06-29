class Api::CandidatesController < ApplicationController
  respond_to :json

  def index
    serialized_candidates =
        ActiveModel::ArraySerializer
            .new(Candidate.all, each_serializer: CandidateSerializer)

    render json: serialized_candidates
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      render json: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.update(candidate_params)
      render json: @candidate
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  private

  def candidate_params
    attributes = [
        :salary,
        :name,
        :contacts,
        :searching,
        :skill_list
    ]

    params.permit(attributes)
  end
end