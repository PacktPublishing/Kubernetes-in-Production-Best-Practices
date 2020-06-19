locals {
  kubelet_extra_args = <<ARGS
--v=3 \
ARGS

  userdata = <<USERDATA
#!/bin/bash
set -o xtrace

/etc/eks/bootstrap.sh --b64-cluster-ca "${var.cluster_ca}" --apiserver-endpoint "${var.cluster_endpoint}" \
USERDATA

  workers_userdata = "${local.userdata} --kubelet-extra-args \"${local.kubelet_extra_args}\"  \"${var.cluster_full_name}\""
}
