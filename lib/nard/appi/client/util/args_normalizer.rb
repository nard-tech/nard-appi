require 'active_support'
require 'active_support/core_ext'

module Nard

  module Appi

    class Client

      # Nard::Appi::Client の補助的な機能を格納する名前空間
      module Util

        # API へ送る情報を処理するクラス
        class ArgsNormalizer

          def self.execute( *args )
            new( *args ).to_a
          end

          def initialize( *args )
            @args = [ args ].flatten
            @options = @args.extract_options!

            process_instance_variables unless has_options?
          end

          def to_a
            [ @args, @options ]
          end

          private

          def has_options?
            @options.present?
          end

          def process_instance_variables
            _args = @args.dup
            last_arg = @args.pop
            if last_arg.present?
              uri = URI.parse( last_arg.to_s )
              @args = [ @args, uri.path ].flatten
              @options = options_from_uri( uri )
            else
              @args = _args
            end
          end

          def options_from_uri( uri )
            uri.query.present? ? Hash[ URI::decode_www_form( uri.query ) ] : {}
          end

        end

      end
    end
  end
end
