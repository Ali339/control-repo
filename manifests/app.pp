node "node-1" {

    class {'tomcat':
    user          => 'tomcat',
    group         => 'tomcat',
    config_path   => '/etc/tomcat/tomcat.conf',
    packages      => [ 'tomcat', 'tomcat-webapps' ],
    service_name  => 'tomcat',
    service_state => running,

    }
   # include base
}
node "node-2" {
    class {'tomcat':
    user          => 'tomcat',
    group         => 'tomcat',
    config_path   => '/etc/tomcat/tomcat.conf',
    packages      => [ 'tomcat', 'tomcat-webapps' ],
    service_name  => 'tomcat',
    service_state => running,
    xms => "54m",
    xmx => "80m"

    }
    #include base
}

node default {
notify { "checkpoint_1":
message => '
checkpoint_1
*****DEFAULT BLOCK APPLIED*****
Looks like there is no node definition for the host
'
    }
}
