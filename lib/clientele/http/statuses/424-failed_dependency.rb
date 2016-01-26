require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class FailedDependency < Concrete

        @code = 424
        @description = "Failed Dependency"

      end
    end
  end
end
