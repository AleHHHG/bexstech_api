# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    questions = Question.by_text(params[:text]).recent
    render json: {
      data: questions
    }
  end

  def show
    render json: Question.find(params[:id]), include: :answers
  end

  def create
    data = Question.create(resource_params)
    return render_json_validation_error(data) if data.errors.present?

    render json: data, status: :created
  end

  private

  def resource_params
    params.permit(:text, :user)
  end
end
