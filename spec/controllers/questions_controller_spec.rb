# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:body) { JSON.parse(response.body) }
  let(:data) { body['data'] }

  RSpec.shared_examples 'default params' do
    it 'returns response with default values' do
      expect(data).to have_key('text')
      expect(data).to have_key('user')
      expect(data).to have_key('total_answers')
      expect(data).to have_key('created_at')
      expect(data).to have_key('updated_at')
    end
  end

  RSpec.shared_examples 'returns http success' do
    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET' do
    let!(:question) { create(:question) }
    context '#index' do
      let(:data) { body['data'].first }
      let(:params) { {} }
      before { get :index, params: params }

      it_behaves_like 'default params'
      it_behaves_like 'returns http success'
    end

    context '#show' do
      let(:data) { body }
      let(:params) { { id: question.id } }
      before { get :show, params: params }

      it_behaves_like 'default params'
      it_behaves_like 'returns http success'
    end

    context '#show_not_found' do
      let(:data) { body }
      let(:params) { { id: 0 } }
      before { get :show, params: params }

      it { expect(response).to have_http_status(:not_found) }
    end
  end

  describe 'POST' do
    context '#create' do
      let(:params) { attributes_for(:question) }
      before { post :create, params: params }

      it { expect(response).to have_http_status(:created) }
    end

    context '#create_bad_request' do
      let(:data) { body }
      before { post :create, params: {} }

      it { expect(response).to have_http_status(:bad_request) }
      it { expect(data).to have_key('errors') }
    end
  end
end
