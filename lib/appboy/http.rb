require 'faraday'
require 'faraday_middleware'
require 'appboy/response'

module Appboy
  class HTTP
    def post(path, payload)
      response = connection.post path do |request|
        request.body = payload
      end

      Appboy::Response.new(response)
    end

    def get(path, query)
      response = connection.get path, query

      Appboy::Response.new(response)
    end

    def connection
      @connection ||= Faraday.new(url: 'https://api.appboy.com') do |connection|
        connection.request :json

        connection.adapter Faraday.default_adapter
      end
    end
  end
end
