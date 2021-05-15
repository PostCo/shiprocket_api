module ShiprocketAPI
  class Awb < Base
    self.prefix += '/courier/assign/awb'
    self.element_name = ''

    DEFAULT_ATTRS = {
      shipment_id: 0,
      courier_id: 0,
      is_return: 0
    }
  end
end
