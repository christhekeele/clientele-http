require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class PermanentRedirect < Concrete

        @code = 308
        @description = "Permanent Redirect"

      end
    end
  end
end
