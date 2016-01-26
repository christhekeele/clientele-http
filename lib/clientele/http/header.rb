require 'forwardable'

module Clientele
  module HTTP
    class Header

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

        attr_reader :name, :value
        def initialize(name, value: nil)
          @name = name.to_s
          @value = value.to_s
        end

      end

      class << self

        attr_reader :name, :value

        def for(name, value: nil)
          if names.include? name
            concrete.find do |status|
              status.name == name
            end.new(value)
          else
            Generic.new(name, value: value)
          end
        end

        def names
          concrete.map(&:name)
        end

        def concrete
          constants.map do |name|
            const_get name
          end.select do |constant|
            constant.ancestors.include?(Header::Concrete) and constant.class != Module
          end
        end

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

require 'clientele/http/request/headers'
require 'clientele/http/response/headers'
