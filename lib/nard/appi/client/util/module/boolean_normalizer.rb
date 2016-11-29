require 'active_support'
require 'active_support/core_ext'

module Nard

  module Appi

    class Client

      # Nard::Appi::Client の補助的な機能を格納する名前空間
      module Util

        module Module

          module BooleanNormalizer

            private

            def normalize_boolean_option( options, key, default: nil )
              v = nil

              if options.has_key?( key )
                v = options.delete( key )
                v = normalize_boolean_value(v)
              elsif options.has_key?( normalize_key( key ) )
                v = options.delete( normalize_key( key ) )
                v = normalize_boolean_value(v)
              end

              v.nil? ? normalize_boolean_value( default ) : v
            end

            def normalize_boolean_value(v)
              if v.instance_of?( String ) or v.instance_of?( Symbol )
                if v.to_s.in?( 't', 'true', 'True', 'TRUE' )
                  true
                elsif v.to_s.in?( 'f', 'false', 'False', 'FALSE' )
                  false
                else
                  nil
                end
              elsif v == true or v == false
                v
              else
                nil
              end
            end

          end

        end
      end
    end
  end
end
