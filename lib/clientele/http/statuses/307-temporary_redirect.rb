require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class TemporaryRedirect < Concrete

        @code = 307
        @description = "Temporary Redirect"

      end
    end
  end
end
