require 'singleton'
require 'forwardable'

module Clientele
  module HTTP
    class Status

      class << self

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
          attr_reader :code, :description
        end

        def_delegators :"self.class", :code, :description
      end

      class Generic < self

        attr_reader :code, :description
        def initialize(code, description: nil)
          @code = code.to_i
          @description = description || "Non-standard HTTP Status"
        end

      end

      def informational?
        code > 99 && code < 200
      end

      def success?
        code > 199 && code < 300
      end

      def redirection?
        code > 299 && code < 400
      end

      def client_error?
        code > 399 && code < 500
      end

      def server_error?
        code > 499 && code < 600
      end

      # Contains a single new request to redirect to
      def redirectable?
        [301, 302, 303, 307, 308].include? code
      end

      # Contains a client or server error
      def error?
        code > 399 && code < 600
      end

      def valid?
        code > 99 && code < 600
      end

      def invalid?
        not valid?
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
