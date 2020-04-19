# frozen_string_literal: true

# Tag Model
class Tag < ApplicationRecord
  #----------Relations ----#
  belongs_to :post
  #----------validation ----#
  validates :name, presence: true
end
