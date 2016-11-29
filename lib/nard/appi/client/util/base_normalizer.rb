require_relative './module/args_normalizer'
require_relative './module/path_normalizer'
require_relative './module/options_normalizer'
require_relative './module/boolean_normalizer'

module Nard

  module Appi

    class Client

      # Nard::Appi::Client の補助的な機能を格納する名前空間
      module Util

        # API へ送る情報を処理するクラス（基底クラス）
        class BaseNormalizer

          include Module::ArgsNormalizer
          include Module::PathNormalizer
          include Module::OptionsNormalizer
          include Module::BooleanNormalizer

          def self.process( *args )
            new( *args ).to_a
          end

          def initialize( *args )
            args, options = normalize_args( args )

            @path = normalize_path( args )

            options = normalize_keys_of_options( options )
            set_special_options( options )

            @options = normalize_values_of_options( options )
          end

          attr_reader :path, :options

          # @return [Array]
          def to_a
            [ @path, @options, special_options ].flatten
          end

          private

          def set_special_options( options )
            nil
          end

          def special_options
            []
          end

        end

      end
    end
  end
end
