module Fog
  module Compute
    class DigitalOceanV2
      class Real
        #
        # Delete a SSH public key from your account
        #
        # @see https://developers.digitalocean.com/documentation/v2/#destroy-a-key
        #
        def destroy_ssh_key(id)
          request(
            :expects  => [200],
            :method   => 'DELETE',
            :path     => "v2/account/keys/#{id}"
          )
        end
      end

      class Mock
        def destroy_ssh_key(id)
          response = Excon::Response.new
          if self.data[:ssh_keys].reject! { |k| k['id'] == id }
            response.status = 204
          else
            response.status = 404
          end
          response
        end
      end
    end
  end
end
