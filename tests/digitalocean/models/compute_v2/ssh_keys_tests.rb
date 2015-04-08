Shindo.tests('Fog::Compute::DigitalOceanV2 | ssh_keys collection', ['digitalocean', 'compute', 'v2']) do

  service =  Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')

  tests('The ssh_keys collection') do
    key = service.ssh_keys.create :name => 'fookey',
                                  :public_key => 'fookey'
    [:all, :get].each do |method|
      test("should respond to #{method}") do
        service.ssh_keys.respond_to? method
      end
    end

    tests('should have Fog::Compute::DigitalOceanV2::SshKey inside') do
      service.ssh_keys.each do |s|
        test { s.kind_of? Fog::Compute::DigitalOceanV2::SshKey }
      end
    end

    tests('should be able to get a model') do
      test('by instance id') do
        retrieved_key = service.ssh_keys.get(key.id)
        test { retrieved_key.kind_of? Fog::Compute::DigitalOceanV2::SshKey }
        test { retrieved_key.name == key.name }
      end
    end

    key.destroy

  end

end
