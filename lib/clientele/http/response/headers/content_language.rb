require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class ContentLanguage < Concrete

        @name = "Content-Language"
        @type = :response

      end
    end
  end
end
