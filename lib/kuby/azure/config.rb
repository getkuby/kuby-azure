require 'kube-dsl'
require 'digest'

module Kuby
  module Azure
    class Config
      extend ::KubeDSL::ValueFields

      value_fields :tenant_id, :client_id, :client_secret, :subscription_id, :credentials
      value_fields :resource_group_name, :resource_name

      def hash_value
        parts = [
          tenant_id, client_id, client_secret, subscription_id,
          resource_group_name, resource_name
        ]

        Digest::SHA256.hexdigest(parts.join(':'))
      end
    end
  end
end
