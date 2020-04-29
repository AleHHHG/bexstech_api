# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    context 'when valid' do
      subject { build :answer }
      it { is_expected.to be_valid }
    end

    context 'when invalid without question' do
      subject { build :answer, question: nil }
      it { is_expected.to belong_to(:question) }
    end

    context 'when invalid without text' do
      subject { build :answer, text: nil }
      it { is_expected.to validate_presence_of(:text) }
    end

    context 'when invalid without user' do
      subject { build :answer, user: nil }
      it { is_expected.to validate_presence_of(:user) }
    end
  end
end
