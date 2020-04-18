# frozen_string_literal: true

# Base controller
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  def render_success(message, data, status)
    render json: { messge: message, data: data }, status: status
  end

  def render_error(error, status)
    render json: { errors: error }, status: status
  end
end
