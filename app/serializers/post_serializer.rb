# frozen_string_literal: true

# post serializer
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_many :comments
  has_many :tags
  has_one :user, class_name: 'User', foreign_key: :author
end
