module ShiprocketAPI
  class Configuration
    attr_accessor :email, :password
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.config=(config)
    @config = config
  end

  def self.configure
    yield config
  end
end
