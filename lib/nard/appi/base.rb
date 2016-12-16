require 'active_support'
require 'active_support/concern'

require 'nard/appi/api_ext/version'
require 'nard/appi/api_ext/client'
require 'nard/appi/api_ext/configuration'
require 'nard/appi/api_ext/environment'

require 'nard/appi/api_ext/initializer'

module Nard

  module Appi

    module Base

      extend ActiveSupport::Concern

      included do
        class << self

          include ActiveSupport::Callbacks

          define_callbacks :default_config

          set_callback :default_config, :before, :before_default_config
          set_callback :default_config, :after, :after_default_config

          private

          def before_default_config
            include Nard::Appi::ApiExt::Version
            include Nard::Appi::ApiExt::Client
            include Nard::Appi::ApiExt::Configuration
            include Nard::Appi::ApiExt::Environment
          end

          def after_default_config
            include Nard::Appi::ApiExt::Initializer
          end

        end
      end

      module ClassMethods

        # 標準設定のモジュールを include するメソッド
        # @param namespace [Module] 標準設定のモジュールが定義されている名前空間
        # @return [Class] namespace に指定した名前空間
        def default_config( namespace )
          run_callbacks :default_config do
            include namespace
          end
        end

      end

    end
  end
end
