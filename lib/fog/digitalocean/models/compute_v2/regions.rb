require 'fog/core/collection'
require 'fog/digitalocean/models/compute/region'

module Fog
  module Compute
    class DigitalOceanV2
      class Regions < Fog::Collection
        model Fog::Compute::DigitalOceanV2::Region

        def all
          load service.list_regions.body['regions']
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
