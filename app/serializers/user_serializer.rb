# frozen_string_literal: true

# user model serializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image
end
