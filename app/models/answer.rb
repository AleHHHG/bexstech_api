# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :text, :user, presence: true
  belongs_to :question

  def add_like
    self.like += 1
  end
end
