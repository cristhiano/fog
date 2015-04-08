require 'fog/core/model'

module Fog
  module Compute
    class DigitalOceanV2
      class Flavor < Fog::Model
        attribute :slug
        attribute :memory
        attribute :vcpus
        attribute :disk
        attribute :transfer
        attribute :price_monthly
        attribute :price_hourly
        attribute :regions
        attribute :available
      end
    end
  end
end
