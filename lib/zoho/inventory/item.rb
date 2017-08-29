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
          "&per_page=#{Zoho.configuration.per_page}"

        return_items_with_image_link(uri)
      end

      def where(**args)
        uri = "#{BASE_URI}#{config_uri}&page=#{@page}" \
          "&per_page=#{Zoho.configuration.per_page}"
        uri << filter_uri(args[:filter_by])
        uri << sort_uri(args[:sort_column], args[:sort_order])
        uri << search_uri(args[:search_text])

        return_items_with_image_link(uri)
      end

      def create(params)
        uri = "#{BASE_URI}#{config_uri}"
        result = request_item('post', uri, body: { JSONString: params.to_json })
        add_image_link(result[:item]) if result[:item]

        result
      end

      def update(item_id, params)
        uri = "#{BASE_URI}/#{item_id}#{config_uri}"
        result = request_item('put', uri, body: { JSONString: params.to_json })
        add_image_link(result[:item]) if result[:item]

        result
      end

      def find(item_id)
        uri = "#{BASE_URI}/#{item_id}#{config_uri}"
        result = request_item('get', uri)
        add_image_link(result[:item]) if result[:item]

        result
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

      def image_uri(item_id)
        "#{BASE_URI}/#{item_id}/image#{config_uri}"
      end

      def add_image_link(item)
        item[:image_link] = unless item[:image_name].empty?
                              image_uri(item[:item_id])
                            end
      end

      def items_add_image_link(items)
        items.map do |item|
          add_image_link(item) if item
        end
      end

      def return_items_with_image_link(uri)
        result = request_item('get', uri)
        items_add_image_link(result[:items]) if result[:items]

        result
      end

      def request_item(method, uri, params = {})
        response = HTTParty.send(method, uri, params)
        JSON.parse(response.body).with_indifferent_access
      end
    end
  end
end
