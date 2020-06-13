## kuby-azure

Azure provider for [Kuby](https://github.com/getkuby/kuby-core).

## Intro

In Kuby parlance, a "provider" is an [adapter](https://en.wikipedia.org/wiki/Adapter_pattern) that enables Kuby to deploy apps to a specific cloud provider. In this case, we're talking about Microsoft's [Azure](https://azure.microsoft.com/), specifically their managed Kubernetes offering.

All providers adhere to a specific interface, meaning you can swap out one provider for another without having to change your code.

## Usage

Enable the Azure provider like so:

```ruby
Kuby.define(:production) do
  kubernetes do

    provider :azure do
      # Visible in the subscription overview.
      subscription_id 'my-subscription-id'

      # Visible in Azure Active Directory.
      tenant_id 'my-tenant-id'

      # These must be configured in Azure Active Directory -> App
      # Registrations. It's easiest to generate a client id and
      # secret for the service principal.
      client_id 'my-client-id'
      client_secret 'my-client-secret'

      # Your cluster should have been created inside a resource group.
      # Put its name here.
      resource_group_name 'my-resource-group-name'

      # The name of your cluster.
      resource_name 'my-resource-name'
    end

  end
end
```

Once configured, you should be able to run all the Kuby rake tasks as you would with any provider.

## License

Licensed under the MIT license. See LICENSE for details.

## Authors

* Cameron C. Dutro: http://github.com/camertron
