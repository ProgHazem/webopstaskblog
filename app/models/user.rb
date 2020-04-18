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

  # validation
  validates_uniqueness_of :email
end
