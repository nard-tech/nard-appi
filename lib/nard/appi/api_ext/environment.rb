require 'active_support'
require 'active_support/core_ext'

require_relative './../environment'

module Nard
  module Appi

    module ApiExt

      module Environment

        extend ActiveSupport::Concern

        module ClassMethods

          # @return [Symbol]
          def environment
            env.to_sym
          end

          # @return [Nard::Appi::Environment]
          def env
            @env ||= Nard::Appi::Environment.instance
          end

          # @return [Symbol]
          def environment=( arg )
            env.update!( arg )
          end

          alias :env= :environment=

        end

      end

    end
  end
end
