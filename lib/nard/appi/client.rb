require_relative './client_ext/request'
require 'faraday'

module Nard

  module Appi

    class Client

      include Nard::Appi::ClientExt::Request

      def initialize( gem_top_namespace, options = {} )
        options_keys = gem_top_namespace::OPTIONS_KEYS

        self.class.class_eval do
          attr_accessor *options_keys
        end

        options = gem_top_namespace.options.merge( options ).with_indifferent_access

        options_keys.each do | key |
          send( "#{ key }=", options[ key ] )
        end
      end

    end
  end
end
