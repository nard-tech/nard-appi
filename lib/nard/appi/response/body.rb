module Nard

  module Appi

    module Response

      class Body

        def initialize( h, client, path, options )
          @h = h

          @client = client
          @path = path
          @options = options

          raise_error_if_needed
        end

        # @return [URI::HTTPS or URI::Generic]
        def path( full: true )
          options = @options.dup.merge( full: full )
          @client.path( @path, options )
        end

        def method_missing( method_name, *args, &block )
          return super unless @h.respond_to?( method_name )
          @h.send( method, *args, &block )
        rescue NoMethodError => e
          rescue_method_missing(e)
        end

        def respond_to?( method, include_all = true )
          return @h.respond_to?( method, include_all ) || super
        end

        private

        def rescue_method_missing(e)
          raise NotImplementedError
        end

        def raise_error_if_needed
          nil
        end

        def rescue_method_missing(e)
          raise NotImplementedError
        end

      end

    end
  end
end
