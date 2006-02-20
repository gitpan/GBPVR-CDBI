package GBPVR::CDBI::CaptureSource;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI';
GBPVR::CDBI::CaptureSource->table('capture_source');
GBPVR::CDBI::CaptureSource->columns(Primary => qw/oid/ );
GBPVR::CDBI::CaptureSource->columns(All => qw/ oid name recording_source_class epgsource_class channel_changer_class / );
1;
__END__

=head1 NAME

GBPVR::CDBI::CaptureSource - GBPVR.capture_source table

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 ATTRIBUTES

oid, name, recording_source_class, epgsource_class, channel_changer_class

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

