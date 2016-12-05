require 'active_support'
require 'active_support/core_ext'

module Nard

  module Appi

    class Client

      # Nard::Appi::Client の補助的な機能を格納する名前空間
      module Util

        module Module

          module OptionsNormalizer

            private

            def normalize_keys_of_options( options )
              h = {}

              options.each do | k, v |
                h[ normalize_key(k) ] = v
              end

              return h
            end

            def normalize_values_of_options( options )
              h = {}

              options.each do | k, v |
                h[k] = normalize_value(v) if active_value?(v)
              end

              return h
            end

            def normalize_key( key )
              raise NotImplementedError
            end

            def normalize_value( value )
              raise NotImplementedError
            end

            def active_value?( value )
              true
            end

          end

        end
      end
    end
  end
end
