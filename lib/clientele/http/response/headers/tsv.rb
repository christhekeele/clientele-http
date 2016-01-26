require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class TSV < Concrete

        @name = "TSV"
        @type = :response

      end
    end
  end
end
