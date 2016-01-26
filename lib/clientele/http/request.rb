require 'forwardable'

require 'clientele/http/verbs'
require 'clientele/http/uri'
require 'clientele/http/request/headers'

module Clientele
  module HTTP
    class Request < Struct.new(:verb, :uri, :headers, :body)

      def initialize(verb, uri, headers, body)
        super Verb.for(verb), Clientele::HTTP::URI.parse(uri), Headers.new(headers), body
      end

    end
  end
end
