require 'active_support'
require 'active_support/core_ext'

module Nard

  module Appi

    class Client

      # Nard::Appi::Client の補助的な機能を格納する名前空間
      module Util

        module Module

          module PathNormalizer

            private

            def normalize_path( args )
              namespaces = args.map( &:to_s ).map { | namespace |
                namespace.split( '/' ).map { | str | str.camelize( :lower ) }
              }.flatten
              namespaces.join( '/' )
            end

          end

        end
      end
    end
  end
end
