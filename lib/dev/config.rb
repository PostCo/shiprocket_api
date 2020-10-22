require "dotenv/load"

def set_config
  ShiprocketAPI.configure do |config|
    config.email = ENV["SHIPROCKET_API_USERNAME"] 
    config.password = ENV["SHIPROCKET_API_PASSWORD"]
  end
end 