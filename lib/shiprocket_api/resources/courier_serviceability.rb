module ShiprocketAPI
  class CourierServiceability < Base
    self.prefix += "/courier/serviceability"
    self.element_name = ""

    class Collection < ActiveResource::Collection
      attr_accessor :is_recommendation_enabled,
                    :recommended_by,
                    :child_courier_id,
                    :recommended_courier_company_id,
                    :shiprocket_recommended_courier_id,
                    :elements

      def initialize(parsed = {})
        @is_recommendation_enabled = parsed["data"]["is_recommendation_enabled"]
        @recommended_by = parsed["data"]["recommended_by"]
        @child_courier_id = parsed["data"]["child_courier_id"]
        @recommended_courier_company_id = parsed["data"]["recommended_courier_company_id"]
        @shiprocket_recommended_courier_id = parsed["data"]["shiprocket_recommended_courier_id"]
        @elements = parsed["data"]["available_courier_companies"]
      end
    end

    self.collection_parser = Collection

    def self.find_every(options)
      instantiate_collection(format.decode(connection.get(collection_path, headers, body: options[:params]).body) || [], options[:params])
    rescue ActiveResource::ResourceNotFound
      # Swallowing ResourceNotFound exceptions and return nil - as per
      # ActiveRecord.
      nil
    end

  end
end