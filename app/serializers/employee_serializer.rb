class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :contacts, :searching, :salary
end