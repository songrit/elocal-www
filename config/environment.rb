RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'Bangkok'
  config.active_record.default_timezone = "Bangkok"
  THAI_MONTHS = %w(มกราคม กุมภาพันธ์ มีนาคม เมษายน พฤษภาคม มิถุนายน กรกฎาคม สิงหาคม กันยายน ตุลาคม พฤศจิกายน ธันวาคม)
  APP_NAME = "elocal-www"
  APP_VERSION = '0.1'
  config.action_controller.session_store = :active_record_store
  IMAGE_LOCATION = "doc/upload"
  CDN = false
  GMAP = false
end
