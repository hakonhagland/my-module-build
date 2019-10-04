# This Makefile.PL creates a pass-through Makefile that simply calls
# the equivalent MyModule::Build methods for each make target.  See the
# documentation for MyModule::Build::Compat for more information.

use 5.006001;


use lib qw(lib);

# bootstrap configure_requires prereqs
BEGIN { do './inc/bootstrap.pl' or die defined($@) ? $@ : $! }

use MyModule::Build::Compat;

MyModule::Build::Compat->run_build_pl(args => \@ARGV);
MyModule::Build::Compat->write_makefile(build_class => 'MyModule::Build');
