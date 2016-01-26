require "clientele/http/status"

module Clientele
  module HTTP
    class Status
      class MultipleChoices < Concrete

        @code = 300
        @description = "Multiple Choices"

      end
    end
  end
end
