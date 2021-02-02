module ShiprocketAPI
  class Label < Base
    self.prefix += "/courier/generate/label"
    self.element_name= ""

    DEFAULT_ATTRS = {
      shipment_id: [0]
    }

  end
end