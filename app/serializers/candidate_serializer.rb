class CandidateSerializer < ActiveModel::Serializer
  attributes :id, :name, :contacts, :searching, :salary, :skill_list
end