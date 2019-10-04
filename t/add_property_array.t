#!/usr/bin/perl -w

use strict;
use lib 't/lib';
use MBTest tests => 1;

blib_load 'MyModule::Build';

ADDPROP: {
  package My::Build::Prop;
  use base 'MyModule::Build';
  __PACKAGE__->add_property( 'list_property' => []);
}

ok grep { $_ eq 'bundle_inc' } My::Build::Prop->array_properties, "has bundle_inc even after adding another array property";

