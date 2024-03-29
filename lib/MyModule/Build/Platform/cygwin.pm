package MyModule::Build::Platform::cygwin;

use strict;
use warnings;
our $VERSION = '0.4229';
$VERSION = eval $VERSION;
use MyModule::Build::Platform::Unix;

our @ISA = qw(MyModule::Build::Platform::Unix);

sub manpage_separator {
   '.'
}

# Copied from ExtUtils::MM_Cygwin::maybe_command()
# If our path begins with F</cygdrive/> then we use the Windows version
# to determine if it may be a command.  Otherwise we use the tests
# from C<ExtUtils::MM_Unix>.

sub _maybe_command {
    my ($self, $file) = @_;

    if ($file =~ m{^/cygdrive/}i) {
        require MyModule::Build::Platform::Windows;
        return MyModule::Build::Platform::Windows->_maybe_command($file);
    }

    return $self->SUPER::_maybe_command($file);
}

1;
__END__


=head1 NAME

MyModule::Build::Platform::cygwin - Builder class for Cygwin platform

=head1 DESCRIPTION

This module provides some routines very specific to the cygwin
platform.

Please see the L<MyModule::Build> for the general docs.

=head1 AUTHOR

Initial stub by Yitzchak Scott-Thoennes <sthoenna@efn.org>

=head1 SEE ALSO

perl(1), MyModule::Build(3), ExtUtils::MakeMaker(3)

=cut
