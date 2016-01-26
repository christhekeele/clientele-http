require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class AcceptDatetime < Concrete

        @name = "Accept-Datetime"
        @type = :request

      end
    end
  end
end
