module Fog
  module Compute
    class DigitalOceanV2
      class Real
        #
        # This method shows a specific public SSH key in your account
        # that can be added to a droplet.
        #
        # @see https://developers.digitalocean.com/documentation/v2/#retrieve-an-existing-key
        #
        def get_ssh_key(id)
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "v2/account/keys/#{id}"
          )
        end
      end

      class Mock
        def get_ssh_key(id)
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "ssh_key"  => self.data[:ssh_keys].find { |k| k['id'] == id }
          }
          response
        end
      end
    end
  end
end
