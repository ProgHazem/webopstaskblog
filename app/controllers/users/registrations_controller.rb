# frozen_string_literal: true

module Users
  # Registeration class
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def sign_up_params
      params.permit(
        :email, :password, :name, :image
      )
    end

    protected

    def render_create_error
      render json: {
        status: 'error',
        errors: resource_errors[:full_messages].uniq
      }, status: 422
    end
  end
end
