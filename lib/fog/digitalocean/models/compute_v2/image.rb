require 'fog/core/model'

module Fog
  module Compute
    class DigitalOceanV2
      class Image < Fog::Model
        identity  :id
        attribute :name
        attribute :distribution
        attribute :slug
        attribute :public
        attribute :regions
        attribute :created_at
        attribute :type
        attribute :min_disk_size
      end
    end
  end
end
