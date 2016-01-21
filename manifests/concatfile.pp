define hari::concatfile ($file=$name, $mode='0400') {
  concat { $file:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => $mode,
  }
}
