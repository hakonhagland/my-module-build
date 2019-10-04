# sample.t -- a sample test file for MyModule::Build

use strict;
use lib 't/lib';
use MBTest tests => 2; # or 'no_plan'
use DistGen;

# Ensure any MyModule::Build modules are loaded from correct directory
blib_load('MyModule::Build');

# create dist object in a temp directory
# enter the directory and generate the skeleton files
my $dist = DistGen->new->chdir_in->regen;

# get a MyModule::Build object and test with it
my $mb = $dist->new_from_context(); # quiet by default
isa_ok( $mb, "MyModule::Build" );
is( $mb->dist_name, "Simple", "dist_name is 'Simple'" );

# vim:ts=2:sw=2:et:sta:sts=2
