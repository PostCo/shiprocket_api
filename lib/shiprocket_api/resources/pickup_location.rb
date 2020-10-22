module ShiprocketAPI
  class PickupLocation < Base
    self.prefix += "/settings/company/addpickup"
    self.element_name = ""

    class Collection < ActiveResource::Collection
      def initialize(parsed = {})
        @elements = parsed["shipping_address"]
      end
    end
    self.collection_parser = Collection

    DEFAULT_ATTRS = {
      pickup_location: "",
      name: "",
      email: "",
      phone: "",
      address: "",
      address_2: "",
      city: "",
      state: "",
      country: "",
      pin_code: ""
    }

    class << self
      def set_prefix_to_list
        ori_prefix = self.prefix
        self.prefix = self.prefix.split("/")[0..-2].append("pickup").join("/")        
        result = yield
        self.prefix = ori_prefix
        result
      end

      def find_every(options)
        set_prefix_to_list do
          prefix_options, query_options = split_options(options[:params])
          path = collection_path(prefix_options, query_options)
          instantiate_collection((format.decode(connection.get(path, headers).body) || []), query_options, prefix_options)
        rescue ActiveResource::ResourceNotFound
          # Swallowing ResourceNotFound exceptions and return nil - as per
          # ActiveRecord.
          set_prefix_to_add
          nil
        end
      end
    end
    
    
  end
end