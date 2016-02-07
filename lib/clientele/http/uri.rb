require 'delegate'

require 'clientele/http/utils'

module Clientele
  module HTTP
    class URI < SimpleDelegator
      
      include Utils::DeepCopy
      include Utils::DeepFreeze

      alias_method :object, :__getobj__

      def inspect
        "#<Clientele::HTTP::URI:#{sprintf("0x%x", object_id << 1)} - #{self}>"
      end

    end
  end
end
