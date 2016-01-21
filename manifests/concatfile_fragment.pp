define hari::concatfile_fragment(
                        $file=$name,
                        $mode='0400',
                        $fragment_name='00',
                        $content="HARi was HERE\n"
                      ) {
  concat::fragment { "${fragment_name} - ${file}":
    target  => $file,
    order   => '01',
    content => $content,
  }
}
