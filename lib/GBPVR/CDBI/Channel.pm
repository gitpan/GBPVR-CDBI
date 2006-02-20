package GBPVR::CDBI::Channel;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI';
GBPVR::CDBI::Channel->table('channel');
GBPVR::CDBI::Channel->columns(Primary => qw/oid/ );
GBPVR::CDBI::Channel->columns(All => qw/ oid name channelID channel_number favourite / );

1;
__END__

=head1 NAME

GBPVR::CDBI::Channel - GBPVR.channel table

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 ATTRIBUTES

oid, name, channelID, channel_number, favourite

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

