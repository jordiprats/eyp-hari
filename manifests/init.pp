class hari(
            $file    = '/.hari',
            $content = "HARi was HERE\n",
            $mode    = '0400',
          ) {
  file { $file:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => $mode,
    content => $content,
  }
}
