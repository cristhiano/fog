Shindo.tests('Fog::Compute[:digitalocean] | list_ssh_keys request', ['digitalocean', 'compute', 'v2']) do

  @ssh_key_format = {
    'id'             => Integer,
    'name'           => String,
    'fingerprint'    => String,
    'public_key'     => String,
  }

  service = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')

  tests('success') do

    ssh_key = service.create_ssh_key 'fookey', 'ssh-dss FOO'

    tests('#list_ssh_keys') do
      service.list_ssh_keys.body['ssh_keys'].each do |key|
        tests('format').data_matches_schema(@ssh_key_format) do
          key
        end
      end
    end

    service.destroy_ssh_key(ssh_key.body['ssh_key']['id'])

  end

end
