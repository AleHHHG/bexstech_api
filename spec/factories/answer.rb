# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    text { 'Teste' }
    user { 'user.teste' }
    question { create(:question) }
    like { 0 }
  end
end
