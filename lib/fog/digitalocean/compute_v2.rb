require 'fog/digitalocean/core'

module Fog
  module Compute
    class DigitalOceanV2 < Fog::Service
      recognizes   :digitalocean_api_token

      recognizes   :digitalocean_api_url

      model_path   'fog/digitalocean/models/compute_v2'
      model        :server
      collection   :servers
      model        :flavor
      collection   :flavors
      model        :image
      collection   :images
      model        :region
      collection   :regions
      model        :ssh_key
      collection   :ssh_keys

      request_path 'fog/digitalocean/requests/compute_v2'
      request      :list_servers
      request      :list_images
      request      :list_regions
      request      :list_flavors
      request      :get_server_details
      request      :create_server
      request      :destroy_server
      request      :reboot_server
      request      :power_cycle_server
      request      :power_off_server
      request      :power_on_server
      request      :shutdown_server
      request      :list_ssh_keys
      request      :create_ssh_key
      request      :get_ssh_key
      request      :destroy_ssh_key

      # request :digitalocean_resize

      class Mock
        def self.data
          @data ||= Hash.new do |hash, key|
            hash[key] = {
              :servers => [],
              :ssh_keys => []
            }
          end
        end

        def self.reset
          @data = nil
        end

        def initialize(options={})
          @digitalocean_api_token = options[:digitalocean_api_token]
        end

        def data
          self.class.data[@digitalocean_api_token]
        end

        def reset_data
          self.class.data.delete(@digitalocean_api_token)
        end
      end

      class Real
        def initialize(options={})
          @digitalocean_api_token = options[:digitalocean_api_token]
          @digitalocean_api_url   = options[:digitalocean_api_url] || \
                                            "https://api.digitalocean.com/v2"
          @connection             = Fog::XML::Connection.new(@digitalocean_api_url)
        end

        def reload
          @connection.reset
        end

        def request(params)
          params[:headers] ||= {}
          params[:headers].merge!('Authorization' => "Bearer #{@digitalocean_api_token}")

          response = retry_event_lock { parse @connection.request(params) }

          unless response.body.empty?
            if response.body['error_message']
              raise Fog::Errors::Error.new response.body.to_s
            end
          end
          response
        end

        private

        def parse(response)
          return response if response.body.empty?
          response.body = Fog::JSON.decode(response.body)
          response
        end

        def retry_event_lock
          count   = 0
          response = nil
          while count < 5
            response = yield

            if response.body && response.body['error_message'] =~ /There is already a pending event for the droplet/
              count += 1
              sleep count ** 3
            else
              break
            end
          end

          response
        end
      end
    end
  end
end
