Shindo.tests('Fog::Compute::DigitalOceanV2 | list_images request', ['digitalocean', 'compute', 'v2']) do

  # {"id"=>1601, "name"=>"CentOS 5.8 x64", "distribution"=>"CentOS"}
  @image_format = {
    'id'           => Integer,
    'name'         => String,
    'distribution' => String,
    'slug'         => Fog::Nullable::String,
    'public'       => Object,
    'regions'      => Array,
    'created_at'   => String,
    'type'         => String,
    'min_disk_size'=> Integer
  }

  tests('success') do

    tests('#list_images') do
      images = Fog::Compute.new(provider: 'DigitalOcean', version: 'V2').list_images.body
      test 'returns a Hash' do
        images.is_a? Hash
      end
      tests('image').formats(@image_format, false) do
        images['images'].first
      end
    end

  end

end
