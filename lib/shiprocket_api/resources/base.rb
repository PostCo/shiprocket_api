module ShiprocketAPI
  class Base < ActiveResource::Base
    cattr_accessor :session

    self.connection_class = ShiprocketAPI::Connection
    self.include_root_in_json = false
    self.include_format_in_path = false
    self.site = "https://apiv2.shiprocket.in"
    self.connection.auth_type = :bearer
    self.prefix = '/v1/external'
    self.session = nil

    class << self
      def create_session(email: ShiprocketAPI.config.email, password: ShiprocketAPI.config.password)
        self.session = Session.create(email: email, password: password)
        self.connection.bearer_token = session.token
      end
  
      def clear_session
        self.session = nil
        self.connection.bearer_token = nil
      end

      def with_temp_session(email:, password:, &block)
        raise ArgumentError, "A block must be given" unless block

        create_session(email: email, password: password)
        yield
        clear_session
      end

      def set_resource(resource)
        ori_prefix = self.prefix
        self.prefix = self.prefix.split("/")[0..-2].append(resource).join("/")        
        result = yield
        self.prefix = ori_prefix
        result
      end
    end

    def initialize(attributes = {}, persisted = false)
      if defined?(self.class::DEFAULT_ATTRS)
        attributes = self.class::DEFAULT_ATTRS.merge(attributes)
      end
      super
    end
  end
end