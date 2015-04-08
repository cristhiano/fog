Shindo.tests('Fog::Compute::DigitalOceanV2 | get_ssh_keys request', ['digitalocean', 'compute', 'v2']) do

  @ssh_key_format = {
    'id'             => Integer,
    'name'           => String,
    'fingerprint'    => String,
    'public_key'     => String,
  }

  service = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')

  tests('success') do

    tests('#get_ssh_key') do
      key = service.create_ssh_key 'fookey', 'ssh-dss FOO'

      tests('format').data_matches_schema(@ssh_key_format) do
        service.get_ssh_key(key.body['ssh_key']['id']).body['ssh_key']
      end

      service.destroy_ssh_key(key.body['ssh_key']['id'])
    end

  end

end
