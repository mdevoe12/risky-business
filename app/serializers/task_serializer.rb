class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description

  has_many :responses
end
