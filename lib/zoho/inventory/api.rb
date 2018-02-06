require 'httparty'
require 'json'

module Zoho
  module Inventory
    class API
      BASE_URI = 'https://inventory.zoho.com/api/v1/'.freeze

      attr_reader :type

      def initialize(type:)
        @type = type
      end

      def construct_uri(path = '')
        URI.parse("#{BASE_URI}#{type}#{path}#{config_uri}")
      end

      def request(uri, method, params = {})
        response = HTTParty.send(method, uri, params)
        JSON.parse(response.body)
      end

      def merge_options(options = {})
        options.map { |key, value| "#{key}=#{value}" }.join('&')
      end

      private

      def config_uri
        "?authtoken=#{Zoho.configuration.auth_token}" \
        "&organization_id=#{Zoho.configuration.organization_id}"
      end
    end
  end
end
