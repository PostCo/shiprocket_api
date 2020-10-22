module ShiprocketAPI
  class CustomOrder < Base
    self.prefix += "/orders/create/adhoc"
    self.element_name = ""

    has_many :order_items, class_name: "ShiprocketAPI::OrderItem"

    DEFAULT_ATTRS = {
      order_id: "1235",
      order_date: Date.today.strftime("%Y-%m-%d"),
      pickup_location: "test1",
      channel_id: "",
      comment: "",
      reseller_name: "",
      company_name: "",
      billing_customer_name: "Andy Chong",
      billing_last_name: "",
      billing_address: "Salarpuria Symbiosis, Arekere Village, Begur, Bannerghatta Main Rd, Uttarahalli Hobli",
      billing_address_2: "",
      billing_city: "Bengaluru",
      billing_pincode: "560076",
      billing_state: "Karnataka",
      billing_country: "India",
      billing_email: "andy@postco.co",
      billing_phone: 9223361686,
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
      sub_total: 1000,
      length: 0.5,
      breadth: 0.5,
      height: 0.5,
      weight: 0.5,
      ewaybill_no: "",
      customer_gstin: ""
    }


  end
end