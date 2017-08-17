require 'faraday'
require 'json'

module Zoho
  module Inventory
    class Item
      include Enumerable

      attr_reader :results

      def initialize
        @results ||= []
      end

      def all
        @results = request_items
        self
      end

      def available
        @results = request_items unless @results.any?

        @results = @results.select do |result|
          !result['available_stock'].nil? && result['available_stock'] > 0
        end
        self
      end

      def recent(items = 4)
        @results = request_items unless @results.any?

        @results = @results.sort_by! do |result|
          result['created_time']
        end[0, items]
        self
      end

      def find(item_id)
        @results = request_items unless @results.any?

        @results = @results.find { |result| result['item_id'] == item_id }
      end

      def each(&block)
        @results.each(&block)
      end

      private

      def api_uri
        'https://inventory.zoho.com/api/v1/items?' \
          "authtoken=#{Zoho.configuration.auth_token}" \
          "&organization_id=#{Zoho.configuration.organization_id}"
      end

      def request_items
        conn = Faraday.get(api_uri)
        append_image_link(JSON.parse(conn.body)['items'])
      end

      def append_image_link(results)
        results.each do |result|
          result['image_link'] = 'https://inventory.zoho.com/api/v1/items/' \
            "#{result['item_id']}/image?" \
            "authtoken=#{Zoho.configuration.auth_token}" \
            "&organization_id=#{Zoho.configuration.organization_id}"
        end
      end
    end
  end
end
