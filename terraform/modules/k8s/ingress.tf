resource "kubernetes_ingress" "sample_app_ingress" {
  depends_on = [helm_release.ingress_nginx]

  metadata {
    name      = "sample-app-ingress"
    namespace = "sample-app-test"
    annotations = {
      "kubernetes.io/ingress.class"                = "nginx"
      "nginx.ingress.kubernetes.io/ssl-redirect"   = "false"
      "nginx.ingress.kubernetes.io/use-regex"      = "true"
      "nginx.ingress.kubernetes.io/rewrite-target" = "/$1"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/?(.*)"

          backend {
            service_name = "sample-app-frontend-service"
            service_port = 80
          }
        }

        path {
          path = "/api/?(.*)"

          backend {
            service_name = "sample-app-backend-service"
            service_port = 3010
          }
        }
      }
    }
  }
}