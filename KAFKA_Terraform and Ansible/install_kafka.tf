resource "null_resource" "install_kafka" {
  count = length(vcd_vapp_vm.kafka_nodes.*.name)

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = element(vcd_vapp_vm.kafka_nodes.*.ip, count.index)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y openjdk-11-jdk wget",
      "wget https://downloads.apache.org/kafka/3.0.0/kafka_2.13-3.0.0.tgz -O /tmp/kafka.tgz",
      "tar -xvf /tmp/kafka.tgz -C /opt/",
      "sudo mv /opt/kafka_2.13-3.0.0 /opt/kafka",
      "echo 'export KAFKA_HOME=/opt/kafka' >> ~/.bashrc",
      "source ~/.bashrc",
      "sudo /opt/kafka/bin/zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties",
      "sudo /opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties"
    ]
  }

  depends_on = [vcd_vapp_vm.kafka_nodes]
}
