require 'shiprocket_api/version'
require 'active_resource'
require 'http'

module ShiprocketAPI
  require 'shiprocket_api/configuration'
  require 'shiprocket_api/connection'
  require 'shiprocket_api/errors'
  require 'shiprocket_api/return_order_collection'

  require 'shiprocket_api/shared/order_helper'

  require 'shiprocket_api/resources/base'
  require 'shiprocket_api/resources/session'
  require 'shiprocket_api/resources/order_item'
  require 'shiprocket_api/resources/forward_shipment'
  require 'shiprocket_api/resources/pickup_location'
  require 'shiprocket_api/resources/channel'
  require 'shiprocket_api/resources/courier_serviceability'
  require 'shiprocket_api/resources/tracking'
  require 'shiprocket_api/resources/label'
  require 'shiprocket_api/resources/pickup'
  require 'shiprocket_api/resources/awb'
  require 'shiprocket_api/resources/return_order'
  require 'shiprocket_api/resources/custom_order'
end
