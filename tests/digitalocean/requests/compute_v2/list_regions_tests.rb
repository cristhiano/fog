Shindo.tests('Fog::Compute::DigitaloceanV2 | list_regions request', ['digitalocean', 'compute', 'v2']) do

  @region_format = {
    'slug'         => String,
    'name'         => String,
    'sizes'        => Array,
    'available'    => Object,
    'features'     => Array
  }

  tests('success') do

    tests('#list_regions') do
      regions = Fog::Compute.new(:provider => 'DigitalOcean', :version => 'V2').list_regions.body
      test 'returns a Hash' do
        regions.is_a? Hash
      end
      tests('region').formats(@region_format, false) do
        regions['regions'].first
      end
    end

  end

end
