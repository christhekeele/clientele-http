require 'forwardable'

module Clientele
  module HTTP
    class Header

      class << self

        attr_reader :name, :value, :type

        def for(name, value, type: nil)
          if names.map(&:downcase).include? name.downcase
            concrete.find do |status|
              status.name.downcase == name.downcase
            end.new(value)
          else
            Generic.new(name, value, type: type)
          end
        end

        def types
          concrete
        end

        def names
          concrete.map(&:name)
        end

        def request_types
          concrete.select do |header|
            header.type == :request
          end
        end

        def request_names
          request_types.map(&:name)
        end

        def response_types
          concrete.select do |header|
            header.type == :response
          end
        end

        def response_names
          response_types.map(&:name)
        end

      private

        def concrete
          constants.map do |name|
            const_get name
          end.select do |constant|
            constant.ancestors.include?(Concrete) and constant.class != Module and constant != Concrete
          end
        end

      end

      class Concrete < self
        extend Forwardable

        class << self
          attr_reader :name, :type
        end

        def_delegators :"self.class", :name, :type

        attr_reader :value
        def initialize(value = nil)
          @value = value.to_s
        end
      end

      class Generic < self

        attr_reader :name, :value, :type
        def initialize(name, value, type: nil)
          @name = name.to_s
          @value = value.to_s
          @type = type ? type.to_sym : :custom
        end

      end

      def == other
        if other.kind_of? Clientele::HTTP::Header
          name == other.name and value == other.value
        else; super; end
      end

      def to_s
        "#{name}: #{value}"
      end

      def inspect
        "#<Clientele::HTTP::Header:#{sprintf("0x%x", object_id << 1)} - #{self}>"
      end

    end
  end
end
