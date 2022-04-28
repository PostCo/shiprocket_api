module ShiprocketAPI
  class Base < ActiveResource::Base
    cattr_accessor :session

    self.connection_class = ShiprocketAPI::Connection
    self.include_root_in_json = false
    self.include_format_in_path = false
    self.site = 'https://apiv2.shiprocket.in'
    connection.auth_type = :bearer
    self.prefix = '/v1/external'
    self.session = nil

    class << self
      def create_session(email: ShiprocketAPI.config.email, password: ShiprocketAPI.config.password)
        self.session = Session.create(email: email, password: password)
        connection.bearer_token = session.token
      end

      def clear_session
        self.session = nil
        connection.bearer_token = nil
      end

      def with_temp_session(email:, password:, &block)
        raise ArgumentError, 'A block must be given' unless block

        create_session(email: email, password: password)
        yield
        clear_session
      end

      def set_prefix(prefix)
        ori_prefix = self.prefix
        self.prefix = prefix
        result = yield
        result
      ensure
        self.prefix = ori_prefix
      end
    end

    def initialize(attributes = {}, persisted = false)
      attributes = self.class::DEFAULT_ATTRS.merge(attributes) if defined?(self.class::DEFAULT_ATTRS)
      super
    end
  end
end
