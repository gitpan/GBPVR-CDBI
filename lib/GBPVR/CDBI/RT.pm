package GBPVR::CDBI::RT;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI';
our $dsn = GBPVR::CDBI::mdb2dsn('C:\program files\devnz\gbpvr\rectracker.mdb');
GBPVR::CDBI::RT->set_db('Main', "dbi:ODBC:$dsn", '', '', $GBPVR::CDBI::dbopts );
1;
__END__

=head1 NAME

GBPVR::CDBI::RT - GBPVR RecTracker utility access

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

