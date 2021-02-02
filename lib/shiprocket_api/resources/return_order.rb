module ShiprocketAPI
  class ReturnOrder < Base
    self.prefix += "/orders/create/return"
    self.element_name= ""
    
    DEFAULT_ATTRS = {
      order_id: "",
      order_date:  "",
      channel_id: "",
      pickup_customer_name: "",
      pickup_last_name: "",
      pickup_address: "",
      pickup_address_2: "",
      pickup_city: "",
      pickup_state: "",
      pickup_country: "",
      pickup_pincode: "",
      pickup_email: "",
      pickup_phone: "",
      pickup_isd_code: "",
      pickup_location_id: "",
      shipping_customer_name: "",
      shipping_last_name: "",
      shipping_address: "",
      shipping_address_2: "",
      shipping_city: "",
      shipping_country: "",
      shipping_pincode: "",
      shipping_state: "",
      shipping_email: "",
      shipping_isd_code: "",
      shipping_phone: "",
      order_items: [
        ShiprocketAPI::OrderItem.new
      ],
      payment_method: "",
      total_discount: "",
      sub_total: "",
      length: "",
      breadth: "",
      height: "",
      weight: ""
    }

    def generate_awb(courier_id:)
      self.awb = Awb.create(
        shipment_id: shipment_id,
        courier_id: courier_id,
        is_return: 1
      )
    end

    def create_pickup(courier_id:)
      self.pickup = Pickup.create(
        shipment_id: shipment_id,
        courier_id: courier_id,
        is_return: 1
      )
    end
  end
end
  