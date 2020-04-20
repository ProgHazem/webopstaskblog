# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'User Registeration', type: :request do
  describe '#Sign up' do
    context 'Success sign up' do
      it 'Should return Status: success and information for user' do
        allow_any_instance_of(User).to receive(:send_confirmation_instructions).and_return(true)
        post '/auth', params: set_complete_params
        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:ok)
        result = JSON.parse(response.body)
        expect(result).to match({ "status" => "success", "data" => result["data"] })
      end
    end

    context 'Failed sign up' do
      it 'should return error message Email can\'t be blank and status must be 422' do
        post '/auth', params: set_params_without_email_password
        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(422)
        result = JSON.parse(response.body)
        expect(result["errors"]).to match(["Email can't be blank", "Email is invalid", "Name can't be blank", "Name is too short (minimum is 5 characters)"])
      end
    end
  end

  private

  def set_complete_params
    attributes_for(:complete_user)
  end

  def set_params_without_email_password
    user_attrubites_without_email_password = set_complete_params
    user_attrubites_without_email_password[:email] = nil
    user_attrubites_without_email_password[:name] = nil
    user_attrubites_without_email_password
  end

end
