Shindo.tests('Fog::Compute::DigitalOceanV2 | destroy_ssh_key request', ['digitalocean', 'compute', 'v2']) do

  service = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')

  tests('success') do

    test('#destroy_ssh_key') do
      key = service.create_ssh_key 'fookey', 'fookey'
      service.destroy_ssh_key(key.body['ssh_key']['id']).status == 204
    end

  end

  tests('failures') do
    test 'delete invalid key' do
      # DigitalOcean API returns 500 with this sometimes
      # so mark it as pending in real mode
      pending unless Fog.mocking?
      service.destroy_ssh_key('00000000000').status == 404
    end
  end

end
