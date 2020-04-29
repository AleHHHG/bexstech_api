# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    text { 'Teste' }
    user { 'user.teste' }
  end
end
