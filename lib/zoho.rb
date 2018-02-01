require 'zoho/version'
require 'zoho/configuration'
require 'zoho/inventory/api'
require 'zoho/inventory/item_group'

module Zoho
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
