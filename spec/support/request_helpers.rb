# frozen_string_literal: true
module Request
  module Authentication
    def sign_in_as(user)
      post '/auth/sign_in', params: { email: user.email, password: 'A1234567!' }
    end

    def response_headers
      response.headers.slice('uid', 'client', 'access-token')
    end

    def response_headers2
      response.headers.slice('client', 'access-token').merge({ uid: "djd@jj.com" })
    end
  end
end
