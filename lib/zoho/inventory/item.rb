require 'active_support/core_ext/hash/indifferent_access'
require 'httparty'
require 'json'

module Zoho
  module Inventory
    class Item
      BASE_URI = 'https://inventory.zoho.com/api/v1/items'.freeze

      def initialize(page: 1)
        @page = page
      end

      def all
        uri = "#{BASE_URI}#{config_uri}&page=#{@page}" \
          "&per_page=#{Zoho.configuration.per_page}" \

        request_item('get', uri)
      end

      def where(**args)
        uri = "#{BASE_URI}#{config_uri}&page=#{@page}" \
          "&per_page=#{Zoho.configuration.per_page}"
        uri << filter_uri(args[:filter_by])
        uri << sort_uri(args[:sort_column], args[:sort_order])
        uri << search_uri(args[:search_text])

        request_item('get', uri)
      end

      def create(params)
        uri = "#{BASE_URI}#{config_uri}"

        request_item('post', uri, body: { JSONString: params.to_json })
      end

      def update(item_id, params)
        uri = "#{BASE_URI}/#{item_id}#{config_uri}"

        request_item('put', uri, body: { JSONString: params.to_json })
      end

      def find(item_id)
        uri = "#{BASE_URI}/#{item_id}#{config_uri}"

        request_item('get', uri)
      end

      def destroy(item_id)
        uri = "#{BASE_URI}/#{item_id}#{config_uri}"

        request_item('delete', uri)
      end

      def active!(item_id)
        uri = "#{BASE_URI}/#{item_id}/active#{config_uri}"

        request_item('post', uri)
      end

      def inactive!(item_id)
        uri = "#{BASE_URI}/#{item_id}/inactive#{config_uri}"

        request_item('post', uri)
      end

      private

      def config_uri
        "?authtoken=#{Zoho.configuration.auth_token}" \
        "&organization_id=#{Zoho.configuration.organization_id}"
      end

      def filter_uri(filter_by)
        filter_by.nil? ? '' : "&filter_by=#{filter_by}"
      end

      def sort_uri(sort_column, sort_order = 'D')
        uri = ''
        uri << "&sort_column=#{sort_column}"
        uri << "&sort_order=#{sort_order}"

        sort_column.nil? ? '' : uri
      end

      def search_uri(text)
        text.nil? ? '' : "&search_text=#{text}"
      end

      def request_item(method, uri, params = {})
        response = HTTParty.send(method, uri, params)
        JSON.parse(response.body).with_indifferent_access
      end
    end
  end
end
