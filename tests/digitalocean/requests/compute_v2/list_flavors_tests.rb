Shindo.tests('Fog::Compute::DigitalOceanV2 | list_flavors request', ['digitalocean', 'compute', 'v2']) do

  # {"id":2,"name":"Amsterdam 1"}
  @flavor_format = {
    "slug"          => String,
    "memory"        => Integer,
    "vcpus"         => Integer,
    "disk"          => Integer,
    "transfer"      => Float,
    "price_monthly" => Float,
    "price_hourly"  => Float,
    "regions"       => Array,
    "available"     => Object
  }

  tests('success') do

    tests('#list_flavor') do
      flavors = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2').list_flavors.body
      test 'returns a Hash' do
        flavors.is_a? Hash
      end
      tests('flavor').formats(@flavor_format, false) do
        flavors['sizes'].first
      end
    end

  end

end
