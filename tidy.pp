$arquivo = 'C:/temp/hello.txt';
$nome = 'apagar'

file { $arquivo:
  ensure  => file,
  content => "aaaa\n",
}

tidy { 'resource title':
  path    => 'C:/temp/',
  # define idade do arquivo/pasta - 0 para remover independente da idade do arquivo
  age     => '0',
  matches => "${$nome}-*",
  recurse => true,
  rmdirs  => true,
  require => [
    File[$arquivo]
    ],

}
