resource "kubernetes_service" "frontend" {
  depends_on = [kubernetes_deployment.frontend]

  metadata {
    name      = "sample-app-frontend-service"
    namespace = "sample-app-test"
  }

  spec {
    type = "LoadBalancer"
    selector = {
      app = "sample-app-frontend"
    }

    port {
      port = 80
    }
  }
}

resource "kubernetes_service" "backend" {
  depends_on = [kubernetes_deployment.backend]

  metadata {
    name      = "sample-app-backend-service"
    namespace = "sample-app-test"
  }

  spec {
    type     = "ClusterIP"
    selector = {
      app = "sample-app-backend"
    }
    
    port {
      port = 3010
    }
  }
}