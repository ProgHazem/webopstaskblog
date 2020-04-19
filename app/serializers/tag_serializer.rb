# frozen_string_literal: true

# tag serializer
class TagSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :post
end
