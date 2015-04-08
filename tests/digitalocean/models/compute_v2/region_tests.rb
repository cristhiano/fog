Shindo.tests("Fog::Compute::DigitaloceanV2 | region model", ['digitalocean', 'compute', 'v2']) do

  service = Fog::Compute.new(:provider => 'DigitalOcean', :version => :v2)
  region  = service.regions.first
  puts region.inspect

  tests('The region model should') do
    tests('have the action') do
      test('reload') { region.respond_to? 'reload' }
    end
    tests('have attributes') do
      model_attribute_hash = region.attributes
      attributes = [
        :slug,
        :name,
        :sizes,
        :available,
        :features
      ]
      tests("The region model should respond to") do
        attributes.each do |attribute|
          test("#{attribute}") { region.respond_to? attribute }
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
