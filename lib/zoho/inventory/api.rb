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

        attach_item_image_url(response)
      end

      def merge_options(options = {})
        options.map { |key, value| "#{key}=#{value}" }.join('&')
      end

      def default_options
        { page: 1, per_page: Zoho.configuration.per_page }
      end

      private

      def config_uri
        "?authtoken=#{Zoho.configuration.auth_token}" \
        "&organization_id=#{Zoho.configuration.organization_id}"
      end

      def item_image_uri(item)
        "#{BASE_URI}items/#{item['item_id']}/image/#{config_uri}"
      end

      def attach_item_image_url(response)
        result = JSON.parse(response.body)

        items_image_url(result['items']) if type == 'items'

        result
      end

      def items_image_url(items)
        items.map do |item|
          unless item['image_name'].empty?
            item['image_url'] = item_image_uri(item)
          end
        end
      end
    end
  end
end
