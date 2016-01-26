require "clientele/http/header"

module Clientele
  module HTTP
    class Header
      class UpgradeInsecureRequests < Concrete

        @name = "Upgrade-Insecure-Requests"
        @type = :response

      end
    end
  end
end
