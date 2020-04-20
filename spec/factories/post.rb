# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :post, class: Post  do
    title { Faker::Name.name }
    body { Faker::Lorem.sentence }
    # association :author, factory: :complete_user
    # association :tags, factory: :tag
  end

end
