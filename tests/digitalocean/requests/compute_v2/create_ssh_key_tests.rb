Shindo.tests('Fog::Compute::DigitalOceanV2 | create_ssh_key request', ['digitalocean', 'compute', 'v2']) do

  @key_format = {
    'id'             => Integer,
    'name'           => String,
    'fingerprint'    => String,
    'public_key'     => String
  }

  service = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')

  tests('success') do

    tests('#create_ssh_key').formats({'ssh_key' => @key_format}) do
      @key = service.create_ssh_key 'fookey', 'fookey'
      @key.body
    end

  end

  service.destroy_ssh_key @key.body['ssh_key']['id']

end
