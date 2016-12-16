require 'active_support'
require 'active_support/concern'

module Nard

  module Appi

    module ApiExt

      module Client

        extend ActiveSupport::Concern

        module ClassMethods

          def client( options = {} )
            self::Client.new( options )
          end

        end

      end

    end
  end
end
