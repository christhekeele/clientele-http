require 'singleton'
require 'forwardable'

module Clientele
  module HTTP
    class Verb

      class << self

        def for(method, request_body: true, response_body: true)
          if methods.include? method.to_sym.upcase
            concrete.find do |verb|
              verb.method == method.to_sym.upcase
            end.instance
          else
            Generic.new(method, request_body: request_body, response_body: response_body)
          end
        end

        def methods
          concrete.map(&:method)
        end

        def all
          concrete.map(&:instance)
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
        include Singleton
        extend Forwardable

        class << self
          attr_reader :method, :request_body, :response_body
        end

        def_delegators :"self.class", :method
        def_delegator :"self.class", :request_body,  :has_request_body?
        def_delegator :"self.class", :response_body, :has_response_body?

      end

      class Generic < self

        attr_reader :method
        def initialize(method, request_body: true, response_body: true)
          @method        = method.upcase.to_sym
          @request_body  = request_body
          @response_body = response_body
        end

        def has_request_body?
          !! @request_body
        end

        def has_response_body?
          !! @response_body
        end

      end

      def == other
        if other.respond_to? :to_sym
          method == other.to_sym.upcase
        else; super; end
      end

      def to_sym
        method
      end

      def to_s
        method.to_s
      end

      def inspect
        "#<Clientele::HTTP::Verb:#{sprintf("0x%x", object_id << 1)} - #{self}>"
      end

    end
  end
end
