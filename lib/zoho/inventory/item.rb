module Zoho
  module Inventory
    class Item
      @api = Zoho::Inventory::API.new(type: 'items')

      def self.all(options = @api.default_options)
        uri       = @api.construct_uri
        uri.query = [uri.query, @api.merge_options(options)].join('&')
        @api.request(uri, 'get')
      end

      def self.find(item_id)
        uri = @api.construct_uri("/#{item_id}")
        @api.request(uri, 'get')
      end

      def self.create(params)
        uri = @api.construct_uri
        @api.request(uri, 'post', body: { JSONString: params.to_json })
      end

      def self.update(item_id, params)
        uri = @api.construct_uri("/#{item_id}")
        @api.request(uri, 'put', body: { JSONString: params.to_json })
      end

      def self.destroy(item_id)
        uri = @api.construct_uri("/#{item_id}")
        @api.request(uri, 'delete')
      end

      def self.active!(item_id)
        uri = @api.construct_uri("/#{item_id}/active")
        @api.request(uri, 'post')
      end

      def self.inactive!(item_id)
        uri = @api.construct_uri("/#{item_id}/inactive")
        @api.request(uri, 'post')
      end
    end
  end
end
