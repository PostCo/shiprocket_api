module ShiprocketAPI
  class Tracking < Base
    self.prefix += "/courier/track/awb"
    self.element_name = ""
    
    class << self

      def find_by_shipment_id(id)
        set_resource('shipment') do
          find(id)
        end
      end

    end
  end
end