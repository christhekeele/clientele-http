require 'clientele/http/header'

require 'clientele/http/request/headers'
require 'clientele/http/response/headers'

module Clientele
  module HTTP
    class Headers

      include Enumerable

      def initialize(hash = {}, type: nil)
        @type = type
        @values = hash.map do |name, value|
          if value.kind_of? Header
            value
          else
            Header.for(name, value, type: type)
          end
        end.freeze
      end

      def [] key
        header = get(key) and header.value
      end

      def include? key
        @values.any? do |header|
          header.name == key
        end
      end
      alias_method :has_key?, :include?

      def keys
        @values.map(&:name)
      end

      def values
        @values.map(&:value)
      end

      def all
        @values
      end

      def get(key)
        @values.find do |header|
          header.name == key
        end
      end

      def set(key, value)
        self.class.new(to_header_hash.merge(key => Header.for(key, value, type: @type)), type: @type)
      end

      def to_h
        Hash[
          @values.map do |header|
            [header.name, header.value]
          end
        ]
      end

      def each(&block)
        if block_given?
          to_h.each &block
        else
          enum_for(:each)
        end
      end

      def each_header(&block)
        if block_given?
          @values.each &block
        else
          enum_for(:each_header)
        end
      end

      def to_s
        @values.map(&:to_s).join("\n")
      end

      def inspect
        type = %i[request response].include? @type
        [
          "#<",
          "Clientele::HTTP::Headers:#{sprintf("0x%x", object_id << 1)}",
          type && !@values.empty? ? " (for #{@type})" : "",
          !@values.empty? ? "\n#{to_s.gsub(/^ */, '  ')}\n" : "",
          ">",
        ].join
      end

      def respond_to_missing?(method_name)
        include? to_key(method_name)
      end

      def method_missing(method_name, *args, &block)
        if args.empty? and key = to_key(method_name) and include? key
          self[key]
        else; super; end
      end

    private

      def to_key(method_name)
        method_name.to_s.split('_').map(&:capitalize).join('-')
      end

      def to_header_hash
        Hash[
          @values.map do |header|
            [header.name, header]
          end
        ]
      end

    end
  end
end
