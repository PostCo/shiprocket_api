module ShiprocketAPI
  class CreationError < ActiveResource::ConnectionError

    def data
      JSON.parse(@response.body).dig("data", "data")      
    end

    def to_s
      JSON.parse(@response.body)["message"]
    end
  end
end