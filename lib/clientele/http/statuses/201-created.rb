require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class Created < Concrete

        @code = 201
        @description = "Created"

      end
    end
  end
end
