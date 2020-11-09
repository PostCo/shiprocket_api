module ShiprocketAPI
  class CustomOrder < Base
    self.prefix += "/orders/create/adhoc"
    self.element_name = ""

    has_many :order_items, class_name: "ShiprocketAPI::OrderItem"

    DEFAULT_ATTRS = {
      order_id: "",
      order_date: Date.today.strftime("%Y-%m-%d"),
      pickup_location: "",
      channel_id: "",
      comment: "",
      reseller_name: "",
      company_name: "",
      billing_customer_name: "",
      billing_last_name: "",
      billing_address: "",
      billing_address_2: "",
      billing_city: "",
      billing_pincode: "",
      billing_state: "",
      billing_country: "",
      billing_email: "",
      billing_phone: "",
      billing_alternate_phone: "",
      shipping_is_billing: true,
      shipping_customer_name: "",
      shipping_last_name: "",
      shipping_address: "",
      shipping_address_2: "",
      shipping_city: "",
      shipping_pincode: "",
      shipping_country: "",
      shipping_state: "",
      shipping_email: "",
      shipping_phone: "",
      order_items: [ShiprocketAPI::OrderItem.new],
      payment_method: "Prepaid",
      shipping_charges: "",
      giftwrap_charges: "",
      transaction_charges: "",
      total_discount: "",
      sub_total: "",
      length: "",
      breadth: "",
      height: "",
      weight: "",
      ewaybill_no: "",
      customer_gstin: ""
    }


  end
end