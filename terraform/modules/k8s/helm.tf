resource "helm_release" "ingress_nginx" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = ">= 3.35.0"

  namespace = "sample-app-test"
  depends_on = [kubernetes_service.frontend, kubernetes_service.backend]

  set {
    name  = "controller.replicasCount"
    value = "2"
  }

  set {
    name  = "controller.nodeSelector.beta\\.kubernetes\\.io/os"
    value = "linux"
  }

  set {
    name  = "defaultBackend.nodeSelector.beta\\.kubernetes\\.io/os"
    value = "linux"
  }

  set {
    name  = "controller.admissionWebhooks.patch.nodeSelector.beta\\.kubernetes\\.io/os"
    value = "linux"
  }
}
