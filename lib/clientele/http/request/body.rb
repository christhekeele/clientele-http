module Clientele
  module HTTP
    class Request < REQUEST
      class Body

        def initialize(content)
          @content = content
        end

        def to_s
          @content.to_s
        end

        def present?
          !! @content
        end

        def stream
          StringIO.new to_s
        end

      end
    end
  end
end
