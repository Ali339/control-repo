node "node-3" {

    class {'tomcat':
    user          => 'tomcat',
    group         => 'tomcat',
    config_path   => '/etc/tomcat/tomcat.conf',
    packages      => [ 'tomcat', 'tomcat-webapps' ],
    service_name  => 'tomcat',
    service_state => running,

    }
    include base
    #include ntp
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
