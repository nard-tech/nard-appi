module Nard

  module Appi

    module ClientExt

      module Request

        # GET メソッドで API へアクセスするメソッド
        def get( *args )
          request( :get, *args )
        end

        # POST メソッドで API へアクセスするメソッド
        def post( *args )
          request( :post, *args )
        end

        # @raise [NotImplementedError]
        def path( *args )
          raise NotImplementedError
        end

        private

        def __request__( con, method, _path, options = {} )
          con.send( method ) do | req |
            case method
            when :get, :delete
              req.url( _path, options )
            when :post, :put
              req.path = _path
              req.body = options unless options.empty?
            end
          end
        end

      end

    end
  end
end
