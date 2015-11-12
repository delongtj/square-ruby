module Hashie
  module Extensions
    module Dash
      module Enum
        # Extend a dash to check for Enum values.
        def self.included(base)
          base.send :include, InstanceMethods
          base.extend ClassMethods

          base.send :alias_method, :set_value, :[]=
          base.send :alias_method, :[]=, :check_enum
        end

        module InstanceMethods
          def check_enum(*args)
            ap args

            set_value(*args)
            self[key] = value
          end


        end

        # Class methods.
        module ClassMethods
          def property(property_name, options = {})
            super

            if options[:enum]
              check_enum(property_name, options[:enum])
            end
          end

          def check_enum(*args)

          end
        end
      end
    end
  end
end
