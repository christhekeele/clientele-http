require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class Tsv < Concrete

        @name = "TSV"
        @type = :response

      end
    end
  end
end
