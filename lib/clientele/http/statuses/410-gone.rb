require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Gone < Concrete

        @code = 410
        @description = "Gone"

      end
    end
  end
end
