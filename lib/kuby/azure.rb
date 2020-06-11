require 'kuby'
require 'kuby/azure/provider'

module Kuby
  module Azure
    autoload :Config, 'kuby/azure/config'
  end
end

Kuby.register_provider(:azure, Kuby::Azure::Provider)
