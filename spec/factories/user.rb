# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :complete_user, class: User do
    email { Faker::Internet.email }
    name { Faker::Name.first_name + Faker::Name.last_name }
    password { 'A1234567!' }
    image { Faker::Avatar.image }
  end
end
