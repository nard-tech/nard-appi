require_relative './client_ext/request'
require 'faraday'

module Nard

  module Appi

    class Client

      include Nard::Appi::ClientExt::Request

      # @!group Methods for DSL

      def self.client_for( namespace )
        set_top_namespace( namespace )
      end

      def self.concerns( *namespaces, under: nil )
        raise ArgumentError unless under.present?
        namespaces.each do | namespace |
          include_concerned_module( namespace, under )
        end
      end

      # @!endgroup

      class << self

        include ActiveSupport::Callbacks

        attr_reader :top_namespace

        private

        # @!group Private methods for DSL

        def set_top_namespace( top_namespace )
          @top_namespace = top_namespace
        end

        def include_concerned_module( namespace, under )
          require "#{ under }/#{ namespace.to_s.downcase }"

          module_name = under.classify
                             .constantize
                             .const_get( namespace.to_s.capitalize )

          # puts "#{ module_name } is included."
          include module_name
        end

        # @!endgroup

        def set_attr_accessor( option_key )
          getter_method = option_key.to_sym
          setter_method = "#{ option_key }=".to_sym
          writer = option_key.to_sym
          attr_reader getter_method unless getter_method.in?( instance_methods )
          attr_writer writer unless setter_method.in?( instance_methods )
        end

      end

      def initialize( options = {} )
        set_attr_accessors
        set_option_values( options )
      end

      private

      def set_attr_accessors
        top_namespace = self.class.top_namespace
        options_keys = top_namespace::OPTIONS_KEYS

        self.class.instance_eval do
          return if @_attr_accessors_defined

          options_keys.each do | option_key |
            set_attr_accessor( option_key )
          end

          @_attr_accessors_defined = true
        end
      end

      def set_option_values( options )
        options_keys = self.class.top_namespace::OPTIONS_KEYS

        options = self.class
                      .top_namespace
                      .options
                      .merge( options )
                      .with_indifferent_access

        options_keys.each do | key |
          send( "#{ key }=", options[ key ] )
        end
      end

    end
  end
end
