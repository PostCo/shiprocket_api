module ShiprocketAPI
  class ReturnOrder::Awb < Base
    self.prefix += "/courier/assign/awb"
    self.element_name= ""

    DEFAULT_ATTRS = {
      shipment_id: 0,
      courier_id: 0,
      is_return: 1
    }

    def generate_label
      return false unless self.attributes.shipment_id != 0

      self.label= ::ShiprocketAPI::Label.create([shipment_id])
    end
  end
end