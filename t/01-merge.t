#!perl

use Test::More tests => 2;
use Test::Deep;

use Config::Merged;

my $expected = {
 Foo => {
   key0 => 'value0',
   key1 => 'value1',
 },
 Bar => {
   key2 => 'value2',
 },
 Baz => {
   key3 => 'value3',
 },
};

{
  my @files  = qw# t/conf/conf0.pl t/conf/conf1.pl #;
  my $config = Config::Merged->load_files({ files => \@files, use_ext => 1 });
  cmp_deeply( $config, $expected, 'load_files' );
}

{
  my @stems  = qw# t/conf/conf0 t/conf/conf/1 #;
  my $config = Config::Merged->load_stems({ stems => \@stems, use_ext => 1 });
  cmp_deeply( $config, $expected, 'load_stems' );
}
