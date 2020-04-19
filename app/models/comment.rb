# frozen_string_literal: true

# comment Model
class Comment < ApplicationRecord
  #------- Relations ---------#
  belongs_to :user
  belongs_to :post
  #----------validation ----#
  validates :body, presence: true

end
