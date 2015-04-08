module Fog
  module Compute
    class DigitalOceanV2
      class Real
        def create_ssh_key( name, public_key )
          request(
            :expects  => [200],
            :method   => 'POST',
            :path     => 'v2/account/keys',
            :query    => { 'name' => name, 'public_key' => public_key }
          )
        end
      end

      class Mock
        def create_ssh_key( name, public_key )
          response = Excon::Response.new
          response.status = 200
          mock_data = {
            "id" => Fog::Mock.random_numbers(1).to_i,
            "name" => name,
            "fingerprint" => Fog::Mock.random_numbers(30),
            "public_key" => public_key
          }
          response.body = {
            "ssh_key"  => mock_data
          }
          self.data[:ssh_keys] << mock_data
          response
        end
      end
    end
  end
end
