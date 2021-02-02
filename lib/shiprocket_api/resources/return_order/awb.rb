module ShiprocketAPI
  class ReturnOrder::Awb < Base
    self.prefix += "/courier/assign/awb"
    self.element_name= ""

    DEFAULT_ATTRS = {
      shipment_id: 0,
      courier_id: 0,
      is_return: 1
    }
  end
end