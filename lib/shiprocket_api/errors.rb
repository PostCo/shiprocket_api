module ShiprocketAPI
  class CreationError < ActiveResource::ConnectionError
    def data
      JSON.parse(@response.body).dig('data', 'data')
    end

    def to_s
      response_json = JSON.parse(@response.body)
      message = response_json.dig('message')
      error_message = response_json.dig('payload', 'error_message')
      action = response_json.dig('payload', 'action')

      message || "#{error_message} when #{action}"
    end
  end
end
