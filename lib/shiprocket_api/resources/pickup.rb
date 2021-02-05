module ShiprocketAPI
  class Pickup < Base
    self.prefix += "/courier/generate/pickup"
    self.element_name= ""

    DEFAULT_ATTRS = {
      shipment_id: [0]
    }
  end
end

