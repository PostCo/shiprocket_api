require "zeitwerk"
require_relative "config"

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "shiprocket_api" => "ShiprocketAPI"
)
loader.push_dir("./lib")
loader.collapse("./lib/shiprocket_api/resources")
loader.ignore("#{__dir__}/config.rb")
loader.enable_reloading
# loader.log!
loader.setup

$__shiprocket_api_loader__ = loader

def reload!
  $__shiprocket_api_loader__.reload
  set_config
  true
end
