require 'active_support'
require 'active_support/concern'

module Nard

  module Appi

    module ApiExt

      module Configuration

        extend ActiveSupport::Concern

        module ClassMethods

          # 設定を行うメソッド
          # @return [Hash]
          def configure
            yield( self )
            return options
          end

          # 設定内容を返すメソッド
          # @return [Hash]
          def options
            option_keys = self::OPTIONS_KEYS
            option_keys.inject( {} ) do | option, key |
              option.merge!( key => send( key ) )
            end
          end

          # デフォルトの設定
          # @return [Hash]
          def default_options
            option_keys = self::OPTIONS_KEYS
            option_keys.inject( {} ) do | option, key |
              option.merge!( key => self.const_get( "DEFAULT_#{ key.upcase }") )
            end
          end

          # 設定内容をデフォルトの状態にするメソッド
          # @return [Hash]
          def reset!
            configure do | config |
              default_options.each do | key, value |
                config.send( "#{ key }=", value )
              end
            end
          end

        end

      end

    end
  end
end
