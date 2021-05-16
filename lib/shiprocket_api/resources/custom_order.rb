module ShiprocketAPI
  class CustomOrder < Base
    include Shared::OrderHelper

    self.prefix += '/orders/create/adhoc'
    self.element_name = ''

    has_many :order_items, class_name: 'ShiprocketAPI::OrderItem'

    DEFAULT_ATTRS = {
      order_id: '',
      order_date: Date.today.strftime('%Y-%m-%d'),
      pickup_location: '',
      channel_id: '',
      comment: '',
      reseller_name: '',
      company_name: '',
      billing_customer_name: '',
      billing_last_name: '',
      billing_address: '',
      billing_address_2: '',
      billing_city: '',
      billing_pincode: '',
      billing_state: '',
      billing_country: '',
      billing_email: '',
      billing_phone: '',
      billing_alternate_phone: '',
      shipping_is_billing: true,
      order_items: [
        ShiprocketAPI::OrderItem.new
      ],
      payment_method: 'Prepaid',
      sub_total: '',
      length: '',
      breadth: '',
      height: '',
      weight: ''
    }

    def generate_awb(courier_id:)
      return false unless attributes['shipment_id'] && shipment_id != 0

      self.awb = ::ShiprocketAPI::Awb.new(
        shipment_id: shipment_id,
        courier_id: courier_id,
        is_return: 0
      )
      awb.save
    end
  end
end
