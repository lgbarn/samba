define samba::global(
  $netbios_name,
  $password_server,
  $workgroup,
  $realm,
  $server_string='Samba Server',
  $log_file='/var/log/samba/%U.%m.log',
  $max_log_size,
  $security='ads',
  $socket_options='TCP_NODELAY',
  $encrypt_passwords='yes',
  $local_master='no',
  $hosts_allow,
  $username_map='/etc/samba/smbusers',
  $socket_options='TCP_NODELAY',
  $wins_support='no',
  $wins_server,
  $wins_client,
  $preserve_case='no',
  $short_preserve_case='no',
  ) {
  $smb = "/root/smb.conf"
  concat {"$smb":
    owner   => root,
    group   => root,
    mode    => '0644',
  }
  concat::fragment{"netbios_name":
    target  => "$smb",
    content => template('samba/smb.conf.erb'),
  }
}
