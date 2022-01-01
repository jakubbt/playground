resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  default_node_pool {
    name       = "agentpool"
    node_count = var.agent_count
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet"
  }

  tags = {
    Environment = "Development"
  }
}

resource "kubernetes_namespace" "sample_app" {
  depends_on = [azurerm_kubernetes_cluster.k8s]

  metadata {
    annotations = {
      name = "sample-app-test"
    }

    labels = {
      mylabel = "aks-testing"
    }

    name = "sample-app-test"
  }
}

resource "kubernetes_secret" "ghsc" {
  depends_on = [kubernetes_namespace.sample_app]

  metadata {
    name      = "dockerconfigjson-github-com"
    namespace = "sample-app-test"
  }

  data = {
    ".dockerconfigjson" = <<DOCKER
    {
      "auths":
        {
          "ghcr.io":
            {
              "auth":"amFrdWJidDpnaHBfaTNMSDFYNVBKUjNWN2F3MWZKNW13YkNKc3d2QzJsMWRkWGJI"
            }
        }
    }
  DOCKER
  }

  type = "kubernetes.io/dockerconfigjson"
}
