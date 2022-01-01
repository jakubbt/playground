resource "kubernetes_deployment" "frontend" {
  depends_on = [kubernetes_secret.ghsc]

  metadata {
    name      = "sample-app-frontend"
    namespace = "sample-app-test"
    labels = {
      app = "sample-app-frontend"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "sample-app-frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "sample-app-frontend"
        }
      }

      spec {
        image_pull_secrets {
          name = "dockerconfigjson-github-com"
        }

        container {
          image             = "ghcr.io/jakubbt/sample-app-frontend:latest"
          name              = "sample-app-frontend"
          image_pull_policy = "Always"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "backend" {
  depends_on = [kubernetes_secret.ghsc]

  metadata {
    name      = "sample-app-backend"
    namespace = "sample-app-test"
    labels    = {
      app = "sample-app-backend"
    }
  }

  spec {
    replicas = 4

    selector {
      match_labels = {
        app = "sample-app-backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "sample-app-backend"
        }
      }

      spec {
        image_pull_secrets {
          name = "dockerconfigjson-github-com"
        }

        container {
          image             = "ghcr.io/jakubbt/sample-app-backend:latest"
          name              = "sample-app-backend"
          image_pull_policy = "Always"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
