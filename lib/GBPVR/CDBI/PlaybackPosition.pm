package GBPVR::CDBI::PlaybackPosition;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI';
GBPVR::CDBI::PlaybackPosition->table('playback_position');
GBPVR::CDBI::PlaybackPosition->columns(Primary => qw/oid/ );
GBPVR::CDBI::PlaybackPosition->columns(All => qw/ oid filename last_position / );
1;
__END__

=head1 NAME

GBPVR::CDBI::PlaybackPosition - GBPVR.playback_position table

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 ATTRIBUTES

oid, filename, last_position

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

