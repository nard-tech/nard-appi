require 'singleton'

module Nard
  module Appi

    class Environment

      include Singleton

      def initialize
        default_environment = :production
        @env = default_environment
      end

      def to_sym
        @env
      end

      def update!( env )
        @env = env.to_sym
      end

      def reset!
        update!( :production )
      end

      def development?
        @env == :development
      end

      def production?
        @env == :production
      end

      def test?
        @env == :test
      end

      def staging?
        @env == :staging
      end

      def method_missing( method_name, *args, &block )
        condition = respond_to?( method_name ) and args.length == 0 and !( block_given? )
        if condition
          /\A(.+)\?\Z/ === method_name.to_s
          @env.to_s == $1
        else
          super
        end
      end

      def respond_to?( method_name, include_all = false )
        return super || /\A(.+)\?\Z/ === method_name.to_s
      end

    end

  end
end
