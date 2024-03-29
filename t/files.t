#!/usr/bin/perl -w

use strict;
use lib 't/lib';
use MBTest tests => 4;

blib_load('MyModule::Build');

my $tmp = MBTest->tmpdir;

use DistGen;
my $dist = DistGen->new( dir => $tmp );
$dist->regen;

$dist->chdir_in;

my $mb = MyModule::Build->new_from_context;

{
  # Make sure copy_if_modified() can handle spaces in filenames

  my @tmp;
  push @tmp, MBTest->tmpdir for (0 .. 1);

  my $filename = 'file with spaces.txt';

  my $file = File::Spec->catfile($tmp[0], $filename);
  open(my $fh, '>', $file) or die "Can't create $file: $!";
  print $fh "Foo\n";
  close $fh;
  ok -e $file;


  my $file2 = $mb->copy_if_modified(from => $file, to_dir => $tmp[1]);
  ok $file2;
  ok -e $file2;
}

{
  # Try some dir_contains() combinations
  my $first  = File::Spec->catdir('', 'one', 'two');
  my $second = File::Spec->catdir('', 'one', 'two', 'three');

  ok( MyModule::Build->dir_contains($first, $second) );
}

