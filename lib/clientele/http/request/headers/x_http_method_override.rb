require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XHttpMethodOverride < Concrete

        @name = "X-Http-Method-Override"
        @type = :request

      end
    end
  end
end
