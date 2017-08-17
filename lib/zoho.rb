require 'zoho/version'
require 'zoho/configuration'
require 'zoho/inventory/item'

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
