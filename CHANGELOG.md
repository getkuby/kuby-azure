## 0.4.0
* Allow configuring a `credentials` object so it's possible to auth without a client secret.

## 0.3.3
* Avoid using `kubernetes_cli` during kubeconfig refresh.
  - Fixes infinite recursion.

## 0.3.2
* Refresh kubeconfig before CLI object is constructed.

## 0.3.1
* Add a unique hash of the configuration options to the kubeconfig path (#1, @pandwoter)

## 0.3.0
* Accept `environment` instead of `definition` instances.

## 0.2.0
* Remove dependency on rails app.
* Refresh kubeconfig in more places.
  - Before setup
  - Before deploy

## 0.1.0
* Birthday!
