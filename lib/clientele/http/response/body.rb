module Clientele
  module HTTP
    class Response < RESPONSE
      class Body

        attr_accessor :raw, :parsed
        def initialize(raw)
          @raw = raw
        end
        
        def parse
          @parsed = if block_given?
            yield @raw
          elsif @parser
            @parser.call @raw
          else
            raise "must supply a parser implementation to parse"
          end
        end
        
        def parsed?
          !!@parsed
        end
        
        def respond_to_missing?(method, priv = true)
          parsed and parsed.respond_to? method, priv
        end
        
        def method_missing(method, *args, **opts, &block)
          if parsed and parsed.respond_to? method
            parsed.send(method, *args, **opts, &block)
          else; super; end
        end

      end
    end
  end
end
