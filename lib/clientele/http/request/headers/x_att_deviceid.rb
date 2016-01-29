require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class XAttDeviceid < Concrete

        @name = "X-ATT-DeviceId"
        @type = :request

      end
    end
  end
end
