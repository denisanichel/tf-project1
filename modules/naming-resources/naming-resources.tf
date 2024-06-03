
resource "null_resource" "run-program" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "local-exec" {
    command = "python ${path.module}/naming-resources-run.py ${var.base_name} ${var.resource_type} > ${path.module}/resource_name.json "
  }
}

output "resource_name" {
  value = jsondecode(file("${path.module}/resource_name.json"))
  depends_on = [null_resource.run-program]
}

#data "external" "get-resource_name" {
#  program = ["python", " ${path.module}/naming-resources-run.py ${var.base_name} ${var.resource_type}"]
#}

#output "resource_name" {
#  value = jsondecode("${data.external.get-resource_name.output}")
#}