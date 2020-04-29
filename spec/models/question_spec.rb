# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    context 'when valid' do
      subject { build :question }
      it { is_expected.to be_valid }
    end

    context 'when invalid without text' do
      subject { build :question, text: nil }
      it { is_expected.to validate_presence_of(:text) }
    end

    context 'when invalid without user' do
      subject { build :question, user: nil }
      it { is_expected.to validate_presence_of(:user) }
    end
  end
end
