require 'dotenv/load'

def set_config
  ShiprocketAPI.configure do |config|
    config.email = ENV['SHIPROCKET_API_EMAIL']
    config.password = ENV['SHIPROCKET_API_PASSWORD']
    config.cache = ActiveSupport::Cache::MemoryStore.new
  end
end
