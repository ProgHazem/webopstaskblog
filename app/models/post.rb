# frozen_string_literal: true

# Post Model
class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :author
  has_many :comments
  has_many :tags
  #----------validation ----#
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
  validates_associated :tags, on: [:create]
  validates :title, :body, :author, presence: true
  validates :tags, presence: true, on: [:create]

  # Callbacks
  after_save :delete_post_after_24

  private

  def delete_post_after_24
    DeletePostWorker.perform_in(1440.minutes, id)
  end
end
