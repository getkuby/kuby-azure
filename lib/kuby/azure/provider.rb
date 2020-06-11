require 'fileutils'
require 'azure_mgmt_container_service'

module Kuby
  module Azure
    class Provider < Kuby::Kubernetes::Provider
      STORAGE_CLASS_NAME = 'default'.freeze

      attr_reader :config

      def configure(&block)
        config.instance_eval(&block)
      end

      def kubeconfig_path
        @kubeconfig_path ||= kubeconfig_dir.join(
          "#{definition.app_name.downcase}-kubeconfig.yaml"
        ).to_s
      end

      def after_configuration
        refresh_kubeconfig
      end

      def storage_class_name
        STORAGE_CLASS_NAME
      end

      private

      def after_initialize
        @config = Config.new
      end

      def client
        @client ||= ::Azure::ContainerService::Profiles::Latest::Mgmt::Client.new(
          tenant_id: config.tenant_id,
          client_id: config.client_id,
          client_secret: config.client_secret,
          subscription_id: config.subscription_id
        )
      end

      def refresh_kubeconfig
        return unless should_refresh_kubeconfig?

        FileUtils.mkdir_p(kubeconfig_dir)

        Kuby.logger.info('Refreshing kubeconfig...')

        cred = client.managed_clusters.list_cluster_user_credentials(
          config.resource_group_name,
          config.resource_name
        )

        kubeconfig = cred.kubeconfigs.first.value.pack('C*')
        File.write(kubeconfig_path, kubeconfig)

        Kuby.logger.info('Successfully refreshed kubeconfig!')
      end

      def should_refresh_kubeconfig?
        !File.exist?(kubeconfig_path) || !can_communicate_with_cluster?
      end

      def can_communicate_with_cluster?
        cmd = [kubernetes_cli.executable, '--kubeconfig', kubeconfig_path, 'get', 'ns']
        `#{cmd.join(' ')}`
        $?.success?
      end

      def kubeconfig_dir
        @kubeconfig_dir ||= definition.app.root.join(
          'tmp', 'kuby-azure'
        )
      end
    end
  end
end
