package MyModule::Build::Platform::aix;

use strict;
use warnings;
our $VERSION = '0.4229';
$VERSION = eval $VERSION;
use MyModule::Build::Platform::Unix;

our @ISA = qw(MyModule::Build::Platform::Unix);

# This class isn't necessary anymore, but we can't delete it, because
# some people might still have the old copy in their @INC, containing
# code we don't want to execute, so we have to make sure an upgrade
# will replace it with this empty subclass.

1;
__END__


=head1 NAME

MyModule::Build::Platform::aix - Builder class for AIX platform

=head1 DESCRIPTION

This module provides some routines very specific to the AIX
platform.

Please see the L<MyModule::Build> for the general docs.

=head1 AUTHOR

Ken Williams <kwilliams@cpan.org>

=head1 SEE ALSO

perl(1), MyModule::Build(3), ExtUtils::MakeMaker(3)

=cut
