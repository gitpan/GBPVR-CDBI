package GBPVR::CDBI::RecordingSchedule;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'GBPVR::CDBI';
GBPVR::CDBI::RecordingSchedule->table('recording_schedule');
GBPVR::CDBI::RecordingSchedule->columns(Primary => qw/oid/ );
GBPVR::CDBI::RecordingSchedule->columns(All => qw/
	oid
	programme_oid
	capture_source_oid
	filename
	status 
	recording_type
	recording_group
	manual_start_time
	manual_end_time
	manual_channel_oid
	quality_level
	pre_pad_minutes
	post_pad_minutes
/, 
);
GBPVR::CDBI::RecordingSchedule->has_a( programme_oid => 'GBPVR::CDBI::Programme');
GBPVR::CDBI::RecordingSchedule->has_a( capture_source_oid => 'GBPVR::CDBI::CaptureSource');
GBPVR::CDBI::RecordingSchedule->has_a( manual_channel_oid => 'GBPVR::CDBI::Channel');
GBPVR::CDBI::RecordingSchedule->columns(Stringify => qw/ programme_oid / );

sub last_position {
  my $obj = shift;
  my ($pp) = GBPVR::CDBI::PlaybackPosition->find_or_create( { filename => $obj->filename } );
  if( @_ ){
    $pp->last_position( shift );
    $pp->update;
  }
  return $pp->last_position;
}
sub archivetable {
  my $obj = shift;
  my ($at) = GBPVR::CDBI::VA::ArchiveTable->search( UniqueID => $obj->programme_oid->unique_identifier );
  return $at;
}
sub status_string {
  my $obj = shift;
  my %mapping = (
	0	=> 'Pending',
	2	=> 'Compeleted',
  );
  return $mapping{ $obj->status };
}
1;
__END__

=head1 NAME

GBPVR::CDBI::RecordingSchedule - GBPVR.recording_schedule table

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

=head1 ATTRIBUTES

oid, programme_oid, capture_source_oid, filename, status, recording_type, recording_group, manual_start_time, manual_end_time, manual_channel_oid, quality_level, pre_pad_minutes, post_pad_minutes

=head1 FOREIGN KEYS

        programme_oid => L<GBPVR::CDBI::Programme>
        capture_source_oid => L<GBPVR::CDBI::CaptureSource>
        manual_channel_oid => L<GBPVR::CDBI::Channel>

=head1 METHODS

=head2 last_position

Alias accessor/mutator for the corresponding (created if none exists) GBPVR::CDBI::PlaybackPosition->last_position attribute.

=head2 archivetable

Attempts to return the corresponding (via unique_identifier) GBPVR::CDBI::VA::ArchiveTable object.

=head2 status_string

Maps $obj->status to a human-readable string.

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

