require 'active_support'
require 'active_support/core_ext'

module Nard

  module Appi

    class Client

      # Nard::Appi::Client の補助的な機能を格納する名前空間
      module Util

        module Module

          module ArgsNormalizer

            private

            def normalize_args( args )
              args = [ args ].flatten
              options = args.extract_options!
              [ args, options.with_indifferent_access ]
            end

          end

        end
      end
    end
  end
end
