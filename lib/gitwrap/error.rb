module Gitwrap
  module Exception
    class APIError < StandardError
      attr_accessor :http_status, :response_body

      def initialize
        message = "[HTTP #{http_status}] #{response_body}"
        super (message)
      end
    end

      class ServerError < APIError; end
      
      class Clienterror < APIError; end
    
  end
end