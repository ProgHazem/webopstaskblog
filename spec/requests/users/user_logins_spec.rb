# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserLogins', type: :request do

  describe 'initial session get' do
    context 'return error' do
      it 'devise_token_auth.sessions.not_supported' do
        get '/auth/sign_in'
        expect(response).to have_http_status(405)
      end
    end
  end

  describe 'successfully login' do
    context 'Create session successfully' do
      it 'works! when credentials are right' do
        post '/auth/sign_in', params: user_data_from_db
        expect(response).to have_http_status(200)
        expect(response.headers).to include("access-token")
      end
    end
  end
  describe 'Error in login' do
    context 'return error messages' do
      it 'there must be return bad_request and error messages' do
        post '/auth/sign_in', params: user_data_from_db(password: '')
        expect(response).to have_http_status(401)
        expect(response.body).to eq(
          "{\"success\":false,\"errors\":[\"Invalid login credentials. Please try again.\"]}"
        )
      end
    end
  end

  private

  def user_data_from_db(password: 'A1234567!')
    user = create(:complete_user)
    { email: user[:email], password: password }
  end
end
