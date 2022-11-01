module ShiprocketAPI
  class Configuration
    attr_accessor :email, :password, :cache
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.config=(config)
    @config = config
  end

  def self.configure
    yield config
    Base.cache = config.cache || ActiveSupport::Cache::NullStore.new
  end
end
