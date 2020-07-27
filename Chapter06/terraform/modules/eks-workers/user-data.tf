locals {
  kubelet_extra_args = <<ARGS
--v=3 \
ARGS

  userdata = <<USERDATA
#!/bin/bash
set -o xtrace

/etc/eks/bootstrap.sh --b64-cluster-ca "${var.cluster_ca}" --apiserver-endpoint "${var.cluster_endpoint}" \
curl -o install_falco -s https://falco.org/script/install \
sudo bash install_falco \
yum install -y iptables-services \
iptables --insert FORWARD 1 --in-interface eni+ --destination 169.254.169.254/32 --jump DROP \
iptables-save | tee /etc/sysconfig/iptables \
systemctl enable --now iptables \
USERDATA

  workers_userdata = "${local.userdata} --kubelet-extra-args \"${local.kubelet_extra_args}\"  \"${var.cluster_full_name}\""
}
