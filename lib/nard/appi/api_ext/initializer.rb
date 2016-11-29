require 'active_support'
require 'active_support/concern'

# @note 確定
module Nard

  module Appi

    module ApiExt

      module Initializer

        extend ActiveSupport::Concern

        included do
          # puts "#{ self } - Nard::Appi::ApiExt::Initializer.#default (OPTIONS_KEYS: #{ self::OPTIONS_KEYS.to_s })"

          # attr_accessor *( self::OPTIONS_KEYS )
          self.class_eval do
            # puts self
            # puts "#{ self } - Nard::Appi::ApiExt::Initializer.#default (OPTIONS_KEYS: #{ self::OPTIONS_KEYS.to_s })"

            mattr_accessor *self::OPTIONS_KEYS

            # puts self.methods.sort.to_s
          end

          # 設定内容をデフォルトの状態にする。
          # @return [Hash]
          reset
        end

      end

    end
  end
end
