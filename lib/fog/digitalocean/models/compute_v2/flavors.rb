require 'fog/core/collection'
require 'fog/digitalocean/models/compute_v2/flavor'

module Fog
  module Compute
    class DigitalOceanV2
      class Flavors < Fog::Collection
        model Fog::Compute::DigitalOceanV2::Flavor

        def all
          load service.list_flavors.body['sizes']
        end

        def get(id)
          all.find { |f| f.id == id }
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
