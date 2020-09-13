# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    user
    sequence(:name) { |n| "Todo #{n}" }
  end
end
