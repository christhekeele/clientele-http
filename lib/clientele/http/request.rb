require 'forwardable'

require 'clientele/http/utils'

module Clientele
  module HTTP
    REQUEST = Struct.new(:verb, :uri, :headers, :body)
    class Request < REQUEST

      include Utils::DeepStructCopy
      include Utils::DeepStructFreeze

      def initialize(verb, uri, headers, body)
        super(
          verb_for(verb),
          uri_for(uri),
          headers_for(headers),
          body_for(body),
        )
      end

      def update_verb(verb)
        clone.tap do |request|
          request.verb = verb
        end
      end

      def update_uri(uri)
        clone.tap do |request|
          request.uri = uri
        end
      end

      def add_header(name, value)
        clone.tap do |request|
          request.headers.set(name, value)
        end
      end

      def update_headers(headers)
        clone.tap do |request|
          request.headers = headers
        end
      end

      def update_body(body)
        clone.tap do |request|
          request.body = body
        end
      end

      def has_body?
        verb.has_request_body? and body.present?
      end

      def expects_response_body?
        verb.has_response_body?
      end

    protected

      def verb= verb
        super verb_for verb
      end

      def uri= uri
        super uri_for uri
      end

      def headers= headers
        super headers_for headers
      end

      def body= body
        super body_for body
      end

    private

      def verb_for(verb)
        Verb.for verb
      end

      def uri_for(uri)
        URI.new uri
      end

      def headers_for(headers)
        Headers.new headers
      end

      def body_for(body)
        Body.new body
      end

      def header_for(name, value)
        Header.new name, value, headers.type
      end

    end
  end
end

require 'clientele/http/verbs'
require 'clientele/http/uri'
require 'clientele/http/request/body'
require 'clientele/http/request/headers'
