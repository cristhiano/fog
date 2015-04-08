module Fog
  module Compute
    class DigitalOceanV2
      class Real
        def list_images(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => 'v2/images'
          )
        end
      end

      class Mock
        def list_images
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "images" => [
              # Sample image
              {
                "id" => 7555620,
                "name" => "Nifty New Snapshot",
                "distribution" => "Ubuntu",
                "slug" => nil,
                "public" => false,
                "regions" => [
                  "nyc1",
                  "nyc2"
                ],
                "created_at" => "2014-11-04T22:23:02Z",
                "type" => "snapshot",
                "min_disk_size" => 20
              },
              {
                "id" => 7555621,
                "name" => "Nifty Old Snapshot",
                "distribution" => "Ubuntu",
                "slug" => "i_have_a_slug",
                "public" => true,
                "regions" => [
                  "nyc2"
                ],
                "created_at" => "2014-11-04T23:23:02Z",
                "type" => "snapshot",
                "min_disk_size" => 10
              }
            ]
          }
          response
        end
      end
    end
  end
end
