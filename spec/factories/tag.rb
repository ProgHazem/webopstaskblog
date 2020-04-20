# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :tag, class: Tag  do
    name { Faker::Name.name }
    association :post, factory: :post
  end
end
