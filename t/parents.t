#!/usr/bin/perl -w

use strict;
use lib 't/lib';
use MBTest tests => 26;

blib_load('MyModule::Build');

#########################

package Foo;
sub foo;

package MySub1;
use base 'MyModule::Build';

package MySub2;
use base 'MySub1';

package MySub3;
use base qw(MySub2 Foo);

package MyTest;
use base 'MyModule::Build';

package MyBulk;
use base qw(MySub2 MyTest);

package main;

ok my @parents = MySub1->mb_parents;
# There will be at least one platform class in between.
ok @parents >= 2;
# They should all inherit from MyModule::Build::Base;
ok ! grep { !$_->isa('MyModule::Build::Base') } @parents;
is $parents[0], 'MyModule::Build';
is $parents[-1], 'MyModule::Build::Base';

ok @parents = MySub2->mb_parents;
ok @parents >= 3;
ok ! grep { !$_->isa('MyModule::Build::Base') } @parents;
is $parents[0], 'MySub1';
is $parents[1], 'MyModule::Build';
is $parents[-1], 'MyModule::Build::Base';

ok @parents = MySub3->mb_parents;
ok @parents >= 4;
ok ! grep { !$_->isa('MyModule::Build::Base') } @parents;
is $parents[0], 'MySub2';
is $parents[1], 'MySub1';
is $parents[2], 'MyModule::Build';
is $parents[-1], 'MyModule::Build::Base';

ok @parents = MyBulk->mb_parents;
ok @parents >= 5;
ok ! grep { !$_->isa('MyModule::Build::Base') } @parents;
is $parents[0], 'MySub2';
is $parents[1], 'MySub1';
is $parents[2], 'MyModule::Build';
is $parents[-2], 'MyModule::Build::Base';
is $parents[-1], 'MyTest';
