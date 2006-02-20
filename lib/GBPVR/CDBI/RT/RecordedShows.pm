package GBPVR::CDBI::RT::RecordedShows;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI::RT';
GBPVR::CDBI::RT::RecordedShows->table('RecordedShows');
GBPVR::CDBI::RT::RecordedShows->columns(Primary => qw/oid/ );
GBPVR::CDBI::RT::RecordedShows->columns(All => qw/
		name sub_title description unqiue_id startdate
	/ );
sub unique_id { my $obj=shift; return $obj->unqiue_id( @_ ); }
1;
__END__

=head1 NAME

GBPVR::CDBI::RT::RecordedShows - RecTracker.RecordedShows table

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 ATTRIBUTES

oid, name, sub_title, description, unqiue_id, startdate

=head1 METHODS

=head2 unique_id

Alias for the unqiue_id (sic) column to correct the spelling.

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

