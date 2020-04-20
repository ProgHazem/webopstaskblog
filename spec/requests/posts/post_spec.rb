# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe '#create' do
    context 'successfully scenario' do
      it 'Should create and return the post' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        post '/posts', params: set_post, headers: response_headers
        expect(response).to have_http_status(201)
      end
    end

    context 'error scenario' do
      it 'Should create and return the post for a user with status error' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        post '/posts', params: set_not_complete_post, headers: response_headers
        expect(response).to have_http_status(422)
        expect(response.body).to eq("{\"errors\":[\"Tags can't be blank\"]}")
      end
    end
  end

  describe '#Get All Post' do
    context 'successfully scenario' do
      it 'Should create and return the post' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        create_post
        get '/posts', headers: response_headers
        expect(response).to have_http_status(200)
      end
    end
  end

  describe '#Get All Post' do
    context 'successfully scenario' do
      it 'Should create and return the empty array' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        get '/posts', headers: response_headers
        expect(response.body).to eq("[]")
        expect(response).to have_http_status(200)
      end
    end
  end

  describe '#update Post' do
    context 'successfully scenario' do
      it 'Should update and return the post' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        post_id = create_update_post
        put "/posts/#{post_id}", params: set_not_complete_post, headers: response_headers
        expect(response).to have_http_status(200)
      end
    end

    context 'successfully scenario' do
      it 'Should update and return the error' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        put '/posts/52', params: set_not_complete_post, headers: response_headers
        expect(response).to have_http_status(404)
      end
    end
  end

  describe '#show Post' do
    context 'successfully scenario' do
      it 'show post and return the post' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        post_id = create_update_post
        get "/posts/#{post_id}", headers: response_headers
        expect(response).to have_http_status(200)
      end
    end

    context 'successfully scenario' do
      it 'show and return the error 404' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        get '/posts/52', headers: response_headers
        expect(response).to have_http_status(404)
      end
    end
  end

  describe '#delete Post' do
    context 'successfully scenario' do
      it 'delete post and return the post' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        post_id = create_update_post
        delete "/posts/#{post_id}", headers: response_headers
        expect(response).to have_http_status(200)
      end
    end

    context 'successfully scenario' do
      it 'delete and return the error 404' do
        user1 = create(:complete_user)
        sign_in_as(user1)
        delete '/posts/52', headers: response_headers
        expect(response).to have_http_status(404)
      end
    end
  end

  private

  def set_post
    post = { post: attributes_for(:post) }
    post[:post][:tags_attributes] = [{ name: 'Laravel' }, { name: 'Ruby on rails' }]
    post
  end

  def set_not_complete_post
    { post: attributes_for(:post) }
  end

  def create_post
    post '/posts', params: set_post, headers: response_headers
  end

  def create_update_post
    post '/posts', params: set_post, headers: response_headers
    JSON.parse(response.body)['id']
  end
end
