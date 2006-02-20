package GBPVR::CDBI::VA;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI';
our $dsn = GBPVR::CDBI::mdb2dsn('C:\program files\devnz\gbpvr\video archive.mdb');
GBPVR::CDBI::VA->set_db('Main', "dbi:ODBC:$dsn", '', '', $GBPVR::CDBI::dbopts );
1;
__END__

=head1 NAME

GBPVR::CDBI::VA - GBPVR Video Archive plug-in access

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

