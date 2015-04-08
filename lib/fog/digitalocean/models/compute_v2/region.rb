require 'fog/core/model'

module Fog
  module Compute
    class DigitalOceanV2
      class Region < Fog::Model
        attribute :slug
        attribute :name
        attribute :sizes
        attribute :available
        attribute :features
      end
    end
  end
end
