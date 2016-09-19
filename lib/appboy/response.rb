require 'json'

module Appboy
  class Response
    attr_reader :status, :body

    def initialize(faraday_response)
      @status = faraday_response.status
      @body   = JSON.parse(faraday_response.body)
    end
  end
end