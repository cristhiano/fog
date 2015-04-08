Shindo.tests("Fog::Compute::DigitalOceanV2 | image model", ['digitalocean', 'compute', 'v2']) do

  service = Fog::Compute.new(provider: 'DigitalOcean', version: 'v2')
  image  = service.images.first

  tests('The image model should') do
    tests('have the action') do
      test('reload') { image.respond_to? 'reload' }
    end
    tests('have attributes') do
      model_attribute_hash = image.attributes
      attributes = [
        :id,
        :name,
        :distribution,
        :slug,
        :public,
        :regions,
        :created_at,
        :type,
        :min_disk_size
      ]
      tests("The image model should respond to") do
        attributes.each do |attribute|
          test("#{attribute}") { image.respond_to? attribute }
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
