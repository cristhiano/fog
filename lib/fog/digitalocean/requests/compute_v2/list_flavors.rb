module Fog
  module Compute
    class DigitalOceanV2
      class Real
        def list_flavors(options = {})
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => 'v2/sizes'
          )
        end
      end

      class Mock
        def list_flavors
          response = Excon::Response.new
          response.status = 200
          response.body = {
            "sizes"  => [
              {
                "slug" => "512mb",
                "memory" => 512,
                "vcpus" => 1,
                "disk" => 20,
                "transfer" => 1.0,
                "price_monthly" => 5.0,
                "price_hourly" => 0.00744,
                "regions" => [
                  "nyc1",
                  "sgp1",
                  "ams1",
                  "ams2",
                  "sfo1",
                  "nyc2",
                  "lon1",
                  "nyc3",
                  "ams3"
                ],
                "available" => true
              },
              {
                "slug" => "1gb",
                "memory" => 1024,
                "vcpus" => 1,
                "disk" => 30,
                "transfer" => 2.0,
                "price_monthly" => 10.0,
                "price_hourly" => 0.01488,
                "regions" => [
                  "nyc2",
                  "sgp1",
                  "ams1",
                  "sfo1",
                  "lon1",
                  "nyc3",
                  "ams3",
                  "ams2",
                  "nyc1"
                ],
                "available" => true
              },
              {
                "slug" => "2gb",
                "memory" => 2048,
                "vcpus" => 2,
                "disk" => 40,
                "transfer" => 3.0,
                "price_monthly" => 20.0,
                "price_hourly" => 0.02976,
                "regions" => [
                  "nyc2",
                  "sfo1",
                  "ams1",
                  "sgp1",
                  "ams2",
                  "lon1",
                  "nyc3",
                  "ams3",
                  "nyc1"
                ],
                "available" => true
              }
            ]
          }
          response
        end
      end
    end
  end
end
