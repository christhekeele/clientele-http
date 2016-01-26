require "addressable/uri"

module Clientele
  module HTTP
    class URI < Addressable::URI

      def inspect
        "#<Clientele::HTTP::URI:#{sprintf("0x%x", object_id << 1)} - #{self}>"
      end

    end
  end
end
