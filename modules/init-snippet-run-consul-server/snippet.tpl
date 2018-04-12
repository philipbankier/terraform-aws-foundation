# start snippet - configure and run consul
${init_prefix}
mkdir /etc/consul.d
cat <<EOT >> ${config_file}
{
  "datacenter": "${datacenter}",
  "data_dir": "${data_dir}",
  "bind_addr": "$(ec2metadata --local-ipv4)",
  "addresses": {
    "http": "0.0.0.0",
    "dns": "127.0.0.1"
  },
  "server": true,
  "bootstrap_expect": 1,
  "ui_dir": "${data_dir}/ui",
  "disable_remote_exec": true,
  "disable_update_check": true,
  "disable_anonymous_signature": true,
  "encrypt": "${encrypt}"
}
EOT
sudo -u consul consul agent -config-file ${config_file} -config-dir /etc/consul.d
${init_suffix}
