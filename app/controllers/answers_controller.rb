# frozen_string_literal: true

class AnswersController < ApplicationController
  def create
    data = Answer.create(resource_params)
    return render_json_validation_error(data) if data.errors.present?

    render json: data, status: :created
  end

  def like
    answer = Answer.find(params[:id])
    answer.add_like
    answer.save
    render json: answer, status: :ok
  end

  private

  def resource_params
    params.permit(:question_id, :text, :user, :like)
  end
end
