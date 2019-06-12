output "id" {
  value = "${list(autoscale,scaleset,actiongroup)}"
}
