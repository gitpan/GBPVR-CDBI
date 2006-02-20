package GBPVR::CDBI;

use warnings;
use strict;

our $VERSION = '0.01';

use base 'Class::DBI';
our $dbopts = { AutoCommit=>0, LongTruncOk => 1, LongReadLen => 255 };
our $dsn = GBPVR::CDBI::mdb2dsn('C:\program files\devnz\gbpvr\gbpvr.mdb');
GBPVR::CDBI->set_db('Main', "dbi:ODBC:$dsn", '', '', $dbopts );
sub mdb2dsn { my $mdb = shift; return 'driver=Microsoft Access Driver (*.mdb);dbq=' . $mdb; }
1;
__END__

=pod

=head1 NAME

GBPVR::CDBI - Database Abstraction for GBPVR

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

Example to search the program listings:

        use GBPVR::CDBI;
        my @rows = GBPVR::CDBI::Programme->search_like(name => 'Star%');

Example to display the recorded shows:

        use GBPVR::CDBI;
        my @rows = GBPVR::CDBI::RecordingSchedule->search(status => 2);
        foreach my $row (@rows){
          printf "-----------------------\n";
          printf "%s - '%s'\n", $row->programme_oid->name, $row->programme_oid->sub_title;
          printf "<%s>\n", $row->filename;
          printf "   %s\n", $row->programme_oid->description;
        }

Example to show pending shows (yes, you should be able to order_by via search() and not have to call sort):

        use GBPVR::CDBI;
        my @rows = GBPVR::CDBI::RecordingSchedule->search(status => 0);
        @rows = sort { $a->manual_start_time cmp $b->manual_start_time } @rows;
        foreach my $row (@rows){
          printf "%-20s %8s %s - '%s'\n",
                $row->manual_start_time,
                $row->programme_oid->channel_oid->name,
                $row->programme_oid->name,
                $row->programme_oid->sub_title;
          printf "   %s\n", $row->programme_oid->description;
        }

Example to force all scheduled 'Simpsons' recordings to be low quality:

        use GBPVR::CDBI;
        my $iterator = GBPVR::CDBI::RecordingSchedule->retrieve_all;
        while( my $row = $iterator->next ){
          next unless $row->programme_oid->name =~ /simpsons/i;
          next if $row->quality_level == 2;
          $row->quality_level(2);
          $row->update;
        }
        GBPVR::CDBI::RecordingSchedule->dbi_commit;

=head1 INTRODUCTION

This set of classes provides an easy to use, robust, and well-documented way to access the GBPVR database via the Class::DBI module.  The major tables are included as well as that of the Video Archiver plugin.

What is GBPVR? It is a Personal Video Recorder (PVR) program. The Microsoft Access .mdb database that is creates stores information such as recording schedules and details about completed recordings. GBPVR can be obtained here:
  http://gbpvr.com

Note that this allows both read and transactional write access to the database.

Why was this written?  In part, as an exercise in L<Class::DBI>, but largely to make it very easy to write stand-alone apps/scripts in perl for GBPVR.  To run any kind of custom task involving setting schedules or listing schedules or listing recorded shows.

More details will follow, but it is possible to compile perl scripts that use this into stand-alone exe's to distribute to systems without perl installed (see L<PAR>).

=head1 GBPVR CLASSES

The following are the provided GBPVR classes. Note that they all inherit from Class::DBI, so that having an attribute of 'foo' means that $obj->foo is an accessor and $obj->foo('bar') is a mutator. Also note that for the foreign keys, the attribute method will return either the foreign key value or the foreign object, depending on the context.

=over 2

=item *

L<GBPVR::CDBI> - Base class for providing access to the GBPVR database.

=item *

L<GBPVR::CDBI::RecordingSchedule> - Access to the 'recording_schedule' table.

=item *

L<GBPVR::CDBI::Programme> - Access to the 'programme' table.

=item *

L<GBPVR::CDBI::PlaybackPosition> - Access to the 'playback_position' table.

=item *

L<GBPVR::CDBI::Channel> - Access to the 'channel' table.

=item *

L<GBPVR::CDBI::CaptureSource> - Access to the 'capture_source' table.

=back

=head1 PLUGIN CLASSES

=head2 Video Archiver

The Video Archive plug-in:
  http://gbpvr.com/pmwiki/pmwiki.php/Plugin/VideoArchive

=over 2

=item *

L<GBPVR::CDBI::VA> - Base class for providing access to the Video Archive database.

=item *

L<GBPVR::CDBI::VA::ArchiveTable> - Access to the 'archivetable' table.

=back

=head2 RecTracker

The RecTracker Utility:
  http://gbpvr.com/pmwiki/pmwiki.php/Utility/RecTracker

=over 2

=item *

L<GBPVR::CDBI::RT> - Base class for providing access to the RecTracker database.

=item *

L<GBPVR::CDBI::RT::RecordedShows> - Access to the 'RecordedShows' table.

=back

=head1 AUTHOR

David Westbrook, C<< <dwestbrook at gmail.com> >>

=head1 PREREQUISITES

GBPVR::CDBI requires the following modules:

L<DBI>

L<DBD::ODBC>

L<Class::DBI>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-gbpvr-cdbi at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=GBPVR-CDBI>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc GBPVR::CDBI

You can also look for information at:

=over 4

=item * Perl Monks -- /msg davidrw

L<http://perlmonks.org>

=item * GBPVR Forums -- pm dwestbrook

L<http://forums.gbpvr.com>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/GBPVR-CDBI>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/GBPVR-CDBI>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=GBPVR-CDBI>

=item * Search CPAN

L<http://search.cpan.org/dist/GBPVR-CDBI>

=back

=head1 ACKNOWLEDGEMENTS

Sub for creating GBPVR

jeff for the VideoArchive plugin

jorm for the RecTracker utility

=head1 COPYRIGHT & LICENSE

Copyright 2006 David Westbrook, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=head1 SEE ALSO

L<Class::DBI>, L<DBD::ODBC>

The initial release/announcement:
  http://forums.gbpvr.com/showthread.php?p=35938#poststop

GBPVR:
  http://gbpvr.com/

GBPVR wiki (documents the program, configuration, plugins, utilities, etc):
  http://www.gbpvr.com/pmwiki

=cut

