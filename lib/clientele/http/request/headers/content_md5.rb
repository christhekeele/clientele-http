require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentMd5 < Concrete

        @name = "Content-MD5"
        @type = :request

      end
    end
  end
end
