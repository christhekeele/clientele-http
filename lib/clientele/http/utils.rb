module Clientele
  module HTTP
    module Utils

      module DeepCopy

        def initialize_copy(original)
          super
          instance_variables.each do |var|
            original_var = original.instance_variable_get(var)
            new_var = cloneable?(original_var) ? original_var.clone : original_var
            instance_variable_set var, new_var
          end
        end

      private

        def cloneable?(object)
          case object
          when NilClass, TrueClass, FalseClass, Symbol, Singleton
            false
          else; true; end
        end

      end

      module DeepFreeze

        def freeze
          super
          instance_variables.each do |var|
            instance_variable_get(var).freeze
          end
        end

      end

      module DeepStructCopy

        def initialize_copy(original)
          super
          members.each do |member|
            original_member = original.send(member)
            self[member]= original_member.clone if cloneable? original_member
          end
        end

        def cloneable?(object)
          case object
          when NilClass, TrueClass, FalseClass, Symbol, Singleton
            false
          else; true; end
        end

      end

      module DeepStructFreeze

        def freeze
          super
          members.each do |member|
            send(member).freeze
          end
        end

      end

    end
  end
end
