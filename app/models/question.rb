# frozen_string_literal: true

class Question < ApplicationRecord
  validates :text, :user, presence: true
  has_many :answers

  scope :by_text, lambda { |text|
    where('text LIKE ?', "%#{text}%") if text.present?
  }

  scope :recent, -> { order('created_at DESC') }

  def as_json(options = {})
    hash = super(options)
    hash[:total_answers] = total_answers
    hash
  end

  def total_answers
    answers.count
  end
end
