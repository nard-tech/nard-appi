require 'active_support'
require 'active_support/core_ext'

module Nard
  module Appi

    module ApiExt

      module DefaultConfiguration

        extend ActiveSupport::Concern

        module ClassMethods

          def default( options = {} )
            raise TypeError unless options.kind_of?( Hash )

            self.class_eval do
              const_set( :OPTIONS_KEYS, options.keys.freeze )

              options.each do | k, v |
                v_frozen = ( v.frozen? ? v : v.freeze )
                const_set( "DEFAULT_#{ k.upcase }", v_frozen )
              end
            end
          end

        end

      end

    end
  end
end
