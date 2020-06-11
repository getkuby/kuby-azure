require 'kube-dsl'

module Kuby
  module Azure
    class Config
      extend ::KubeDSL::ValueFields

      value_fields :tenant_id, :client_id, :client_secret, :subscription_id
      value_fields :resource_group_name, :resource_name
    end
  end
end
