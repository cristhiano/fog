Shindo.tests("Fog::Compute::DigitalOceanV2 | flavor model", ['digitalocean', 'compute', 'v2']) do

  service = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')
  flavor  = service.flavors.first

  tests('The flavor model should') do
    tests('have the action') do
      test('reload') { flavor.respond_to? 'reload' }
    end
    tests('have attributes') do
      model_attribute_hash = flavor.attributes
      attributes = [
        :slug,
        :memory,
        :vcpus,
        :disk,
        :transfer,
        :price_monthly,
        :price_hourly,
        :regions,
        :available
      ]
      tests("The flavor model should respond to") do
        attributes.each do |attribute|
          test("#{attribute}") { flavor.respond_to? attribute }
        end
      end
      tests("The attributes hash should have key") do
        attributes.each do |attribute|
          test("#{attribute}") { model_attribute_hash.key? attribute }
        end
      end
    end
  end

end
