module Clientele
  module HTTP
    VERBS = Set.new(%i[head get post put delete patch connect options]).freeze
  end
end
