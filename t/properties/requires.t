# sample.t -- a sample test file for MyModule::Build

use strict;
use lib 't/lib';
use MBTest;
use DistGen;

plan tests => 4;

# Ensure any MyModule::Build modules are loaded from correct directory
blib_load('MyModule::Build');

my ($dist, $mb, $prereqs);

#--------------------------------------------------------------------------#
# try undefined prereq version
#--------------------------------------------------------------------------#

$dist = DistGen->new( name => 'Simple::Requires' );

$dist->change_build_pl(
  module_name => 'Simple::Requires',
  requires => {
    'File::Basename' => undef,
  },
)->regen;

$dist->chdir_in;

$mb = $dist->new_from_context();
isa_ok( $mb, "MyModule::Build" );

$prereqs = $mb->_normalize_prereqs;
is($prereqs->{runtime}{requires}{'File::Basename'}, 0, "undef prereq converted to 0");

#--------------------------------------------------------------------------#
# try empty string prereq version
#--------------------------------------------------------------------------#

$dist->change_build_pl(
  module_name => 'Simple::Requires',
  requires => {
    'File::Basename' => '',
  },
)->regen;

$mb = $dist->new_from_context();
isa_ok( $mb, "MyModule::Build" );

$prereqs = $mb->_normalize_prereqs;
is($prereqs->{runtime}{requires}{'File::Basename'}, 0, "empty string prereq converted to 0");


# vim:ts=2:sw=2:et:sta:sts=2
