require 'active_support'
require 'active_support/concern'

module Nard

  module Appi

    module ApiExt

      module Client

        extend ActiveSupport::Concern

        module ClassMethods

          def client( gem_top_namespace, options = {} )
            gem_top_namespace::Client.new( options )
          end

        end

      end

    end
  end
end
