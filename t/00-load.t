#!perl -T

use Test::More tests => 10;

BEGIN {
	use_ok( 'GBPVR::CDBI' );
	use_ok( 'GBPVR::CDBI::VA' );
	use_ok( 'GBPVR::CDBI::VA::ArchiveTable' );
	use_ok( 'GBPVR::CDBI::Channel' );
	use_ok( 'GBPVR::CDBI::CaptureSource' );
	use_ok( 'GBPVR::CDBI::Programme' );
	use_ok( 'GBPVR::CDBI::PlaybackPosition' );
	use_ok( 'GBPVR::CDBI::RecordingSchedule' );
	use_ok( 'GBPVR::CDBI::RT' );
	use_ok( 'GBPVR::CDBI::RT::RecordedShows' );
}

diag( "Testing GBPVR::CDBI $GBPVR::CDBI::VERSION, Perl $], $^X" );
