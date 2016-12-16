require_relative './client_ext/request'
require 'faraday'

module Nard

  module Appi

    class Client

      include Nard::Appi::ClientExt::Request

      def self.concerns( *namespaaces, under: nil )
        raise ArgumentError unless under.present?
        namespaaces.each do | file_basename |
          require "#{ under }/#{ file_basename.to_s.downcase }"
          module_name = ( under.classify.constantize ).const_get( file_basename.to_s.capitalize )
          puts "#{ module_name } is included."
          include module_name
        end
      end

      def initialize( gem_top_namespace, options = {} )
        options_keys = gem_top_namespace::OPTIONS_KEYS

        self.class.instance_eval do
          set_attr_accessors( options_keys )
        end

        options = gem_top_namespace.options.merge( options ).with_indifferent_access

        options_keys.each do | key |
          send( "#{ key }=", options[ key ] )
        end
      end

      def self.set_attr_accessors( options_keys )
        return if @_attr_accessors_defined

        options_keys.each do | option_key |
          getter_method = option_key.to_sym
          setter_method = "#{ option_key }=".to_sym
          writer = option_key.to_sym
          attr_reader getter_method unless getter_method.in?( self.class.instance_methods )
          attr_writer writer unless setter_method.in?( self.class.instance_methods )
        end

        @_attr_accessors_defined = true
      end

    end
  end
end
