module ShiprocketAPI
  class ReturnOrder < Base
    include Shared::OrderHelper

    self.prefix += '/orders/create/return'
    self.element_name = ''

    has_many :order_items, class_name: 'ShiprocketAPI::OrderItem'

    self.collection_parser = ReturnOrderCollection

    DEFAULT_ATTRS = {
      order_id: '',
      order_date: '',
      channel_id: '',
      pickup_customer_name: '',
      pickup_last_name: '',
      pickup_address: '',
      pickup_address_2: '',
      pickup_city: '',
      pickup_state: '',
      pickup_country: '',
      pickup_pincode: '',
      pickup_email: '',
      pickup_phone: '',
      pickup_isd_code: '',
      pickup_location_id: '',
      shipping_customer_name: '',
      shipping_last_name: '',
      shipping_address: '',
      shipping_address_2: '',
      shipping_city: '',
      shipping_country: '',
      shipping_pincode: '',
      shipping_state: '',
      shipping_email: '',
      shipping_isd_code: '',
      shipping_phone: '',
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

    class << self
      def set_prefix_to_list_all(&block)
        set_prefix("#{Base.prefix}/orders/processing/return", &block)
      end

      def find_every(options)
        set_prefix_to_list_all do
          super
        end
      end
    end

    def generate_awb(courier_id:)
      return false unless attributes['shipment_id'] && shipment_id != 0

      self.awb = ::ShiprocketAPI::Awb.new(
        shipment_id: shipment_id,
        courier_id: courier_id,
        is_return: 1
      )
      awb.save
    end
  end
end

# reload!
# ShiprocketAPI::Base.create_session
# orders = ShiprocketAPI::ReturnOrder.all
# orders.fetch_next_page
