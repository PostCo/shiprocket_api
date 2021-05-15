module Shared
  module OrderHelper
    def generate_label
      return false unless attributes['shipment_id'] && shipment_id != 0

      self.label = ::ShiprocketAPI::Label.new(shipment_id: [shipment_id])
      label.save
    end

    def create_pickup
      return false unless attributes['shipment_id'] && shipment_id != 0

      self.pickup = ::ShiprocketAPI::Pickup.new(shipment_id: [shipment_id])
      pickup.save
    end
  end
end
