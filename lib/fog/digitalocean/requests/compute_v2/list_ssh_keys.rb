module Fog
  module Compute
    class DigitalOceanV2
      class Real
        def list_ssh_keys(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => 'v2/account/keys'
          )
        end
      end

      class Mock
        def list_ssh_keys
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "ssh_keys"  => self.data[:ssh_keys]
          }
          response
        end
      end
    end
  end
end
