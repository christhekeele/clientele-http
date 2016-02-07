module Clientele

  class Exception < StandardError; end

  module HTTP

    class Exception < Clientele::Exception; end

  end
end
