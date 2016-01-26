require 'singleton'
require 'forwardable'

module Clientele
  module HTTP
    class Status

      class Concrete < self
        include Singleton
        extend Forwardable

        class << self
          attr_reader :code, :description
        end

        def_delegators :"self.class", :code, :description
      end

      class Generic < self

        attr_reader :code, :description
        def initialize(code, description: nil)
          @code = code.to_i
          @description = description || "Non-concrete HTTP Status"
        end

      end

      class << self

        attr_reader :code, :description

        def for(code, description: nil)
          if codes.include? code
            concrete.find do |status|
              status.code == code.to_i
            end.instance
          else
            Generic.new(code, description: description)
          end
        end

        def codes
          concrete.map(&:code)
        end

        def concrete
          constants.map do |name|
            const_get name
          end.select do |constant|
            constant.ancestors.include?(Status::Concrete) and constant.class != Module
          end
        end

      end

      def == other
        if other.respond_to? :to_i
          code == other.to_i
        else; super; end
      end

      def to_i
        code
      end

      def to_s
        "#{code}: #{description}"
      end

      def inspect
        "#<Clientele::HTTP::Status:#{sprintf("0x%x", object_id << 1)} - #{self}>"
      end

    end
  end
end

require 'clientele/http/statuses'
