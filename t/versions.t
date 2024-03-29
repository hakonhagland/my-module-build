#!/usr/bin/perl -w

use strict;
use lib 't/lib';
use MBTest tests => 2;

blib_load('MyModule::Build');

my $tmp = MBTest->tmpdir;

use DistGen;
my $dist = DistGen->new( dir => $tmp );
$dist->regen;

#########################

my @mod = split( /::/, $dist->name );
my $file = File::Spec->catfile( $dist->dirname, 'lib', @mod ) . '.pm';
is( MyModule::Build->version_from_file( $file ), '0.01', 'version_from_file' );

ok( MyModule::Build->compare_versions( '1.01_01', '>', '1.01' ), 'compare: 1.0_01 > 1.0' );
