class {'samba::server':
  workgroup => 'LOLVM',
  server_string => 'Lustre exported to SAMBA',
  interfaces => 'eth0 lo',
  security => 'share',
}

samba::server::share {'lustre':
  comment => 'Lustre share',
  path => '/export/lustre',
  guest_only => true,
  guest_ok => true,
  guest_account => "root",
  browsable => true,
  create_mask => 0777,
  force_create_mask => 0777,
  directory_mask => 0777,
  force_directory_mask => 0777,
  force_group => 'root',
  force_user => 'root',
}


include netatalk
netatalk::server { 'lustre-export':
    options => ["-uamlist uams_guest.so", "defaultvol /etc/netatalk/AppleVolumes.default"],
}

netatalk::volume { 'lustre':
    path => '/export/lustre',
  }

    include nfs::server
    nfs::server::export{ '/export/lustre':
      ensure  => 'present',
      clients => '*(rw,insecure,async,no_root_squash) localhost(rw)'
  }

service {'autofs':
    ensure => 'running',
    enable => true,
#    subscribe => File['/etc/auto.master', '/etc/auto.misc'];
}

class lolvm-lustre {
      $lustre = hiera('lustre')

file {'/etc/auto.master':
      ensure => present,
      content => '/export auto.misc';
      }
file {'/etc/auto.misc':
      ensure => present,
      content => "lustre    -fstype=lustre,${lustre['options']}  ${lustre['uri']}";
  }
}
