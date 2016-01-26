require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class SeeOther < Concrete

        @code = 303
        @description = "See Other"

      end
    end
  end
end
