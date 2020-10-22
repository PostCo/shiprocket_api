module ShiprocketAPI
  class ForwardShipment < Base
    self.prefix += "/shipments/create/forward-shipment"
    self.element_name = ""

    DEFAULT_ATTRS = {
      mode: "",
      request_pickup: true,
      print_label: true,
      generate_manifest: "",
      ewaybill_no: "",
      courier_id: "",
      reseller_name: "",
      order_id: "",
      isd_code: "",
      billing_isd_code: "",
      order_date: "",
      channel_id: "",
      company_name: "",
      billing_customer_name: "",
      billing_last_name: "",
      billing_address: "",
      billing_address_2: "",
      billing_city: "",
      billing_state: "",
      billing_country: "",
      billing_pincode: "",
      billing_email: "",
      billing_phone: "",
      billing_alternate_phone: "",
      shipping_is_billing: "",
      shipping_customer_name: "",
      shipping_last_name: "",
      shipping_address: "",
      shipping_address_2: "",
      shipping_city: "",
      shipping_state: "",
      shipping_country: "",
      shipping_pincode: "",
      shipping_email: "",
      shipping_phone: "",
      order_items: [
       ShiprocketAPI::OrderItem.new 
      ],
      payment_method: "",
      shipping_charges: "",
      giftwrap_charges: "",
      transaction_charges: "",
      total_discount: "",
      sub_total: "",
      weight: "",
      length: "",
      breadth: "",
      height: "",
      pickup_location: "",
      customer_gstin: "",
      vendor_details: {
        email: "",
        phone: "",
        name: "",
        address: "",
        address_2: "",
        city: "",
        state: "",
        country: "",
        pin_code: "",
        pickup_location: ""
      }
    }
  end
end