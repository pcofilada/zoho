module Zoho
  module Inventory
    class ItemGroup
      @api = Zoho::Inventory::API.new(type: 'itemgroups')

      def self.all(options = @api.default_options)
        uri       = @api.construct_uri
        uri.query = [uri.query, @api.merge_options(options)].join('&')
        @api.request(uri, 'get')
      end

      def self.find(itemgroup_id)
        uri = @api.construct_uri("/#{itemgroup_id}")
        @api.request(uri, 'get')
      end

      def self.create(params)
        uri = @api.construct_uri
        @api.request(uri, 'post', body: { JSONString: params.to_json })
      end

      def self.update(itemgroup_id, params)
        uri = @api.construct_uri("/#{itemgroup_id}")
        @api.request(uri, 'put', body: { JSONString: params.to_json })
      end

      def self.destroy(itemgroup_id)
        uri = @api.construct_uri("/#{itemgroup_id}")
        @api.request(uri, 'delete')
      end

      def self.active!(itemgroup_id)
        uri = @api.construct_uri("/#{itemgroup_id}/active")
        @api.request(uri, 'post')
      end

      def self.inactive!(itemgroup_id)
        uri = @api.construct_uri("/#{itemgroup_id}/inactive")
        @api.request(uri, 'post')
      end
    end
  end
end
