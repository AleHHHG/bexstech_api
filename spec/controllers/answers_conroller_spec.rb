# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:body) { JSON.parse(response.body) }
  let!(:question) { create(:question) }

  describe 'POST' do
    context '#create' do
      before do
        post :create, params: {
          question_id: question.id, text: 'teste', user: 'user.teste'
        }
      end
      it { expect(response).to have_http_status(:created) }
    end

    context '#create_bad_request' do
      let(:data) { body }
      before { post :create, params: {} }

      it { expect(response).to have_http_status(:bad_request) }
      it { expect(data).to have_key('errors') }
    end
  end

  describe 'PUT' do
    let(:answer) { create(:answer) }
    context '#like' do
      before do
        put :like, params: {
          id: answer.id,
        }
      end
      it 'change' do
        expect(response).to have_http_status(:success)
        expect(answer.reload.like).to eq(1)
      end
    end
  end
end