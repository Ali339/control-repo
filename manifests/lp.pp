
node 'node-4' {
  include ::haproxy
  haproxy::listen { 'app':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
  haproxy::balancermember { 'app1':
    listening_service => 'app',
    server_names      => 'node-1',
    ipaddresses       => '161.35.59.60',
    ports             => '8080',
    options           => 'check',
  }
  haproxy::balancermember { 'app2':
    listening_service => 'app',
    server_names      => 'node-2',
    ipaddresses       => '161.35.105.160',
    ports             => '8080',
    options           => 'check',
  }
  }
