# frozen_string_literal: true

# User Model
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # mount image
  mount_uploader :image, ImageUploader

  #------------------------- Relations ----------------------#
  has_many :posts, foreign_key: :author
  has_many :comments
  # validation
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 8 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end
