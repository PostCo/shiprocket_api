require "shiprocket_api/version"
require "active_resource"
require 'http'

module ShiprocketAPI

  require 'shiprocket_api/configuration'
  require 'shiprocket_api/connection'

  require 'shiprocket_api/resources/base'
  require 'shiprocket_api/resources/session'
  require 'shiprocket_api/resources/order_item'
  require 'shiprocket_api/resources/custom_order'
  require 'shiprocket_api/resources/forward_shipment'
  require 'shiprocket_api/resources/pickup_location'
  require 'shiprocket_api/resources/channel'
  require 'shiprocket_api/resources/courier_serviceability'
end
