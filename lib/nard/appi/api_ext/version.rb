require 'active_support'
require 'active_support/concern'

module Nard

  module Appi

    module ApiExt

      module Version

        extend ActiveSupport::Concern

        module ClassMethods

          # この Gem のバージョン（Xxxx:VERSION を返す）
          # @note 利用する API のバージョンではない！ 利用する API のバージョンは、Xxxx.api_version で取得する。
          # @return [String]
          def gem_version
            self::VERSION
          end

        end

      end

    end
  end
end
