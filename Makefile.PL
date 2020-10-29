
# A generic Makefile.PL file for any pure Perl/Tk mega-widget.
# Update %widinfo.
# Leave $widtrib undefined unless you have an addition for widget's User
# Contributed Demonstrations section.
#
# This program creates the MANIFEST and test.pl files, then invokes
# MakeMaker to create the Makefile.  sol0@Lehigh.EDU, 2001/01/01

use strict;
use warnings;
use v5.5;
use Tk::MMutil;
use vars qw/$widinfo $widtrib %widtrib/;

# $widtrib = 'metest.pl';	# widtrib demo file name

print "Writing MANIFEST for Tk::MatchEntry\n";
open MANIFEST, ">MANIFEST" or die "Cannot open MANIFEST: $!";
print MANIFEST <<"end-of-manifest";
MANIFEST
Makefile.PL
MatchEntry.pm
test.pl
ChangeLog
README
META.yml                                 Module meta-data (added by MakeMaker)
end-of-manifest
print MANIFEST "$widtrib\n" if $widtrib;
close MANIFEST or die $!;

%widtrib = 
  ($widtrib => "\$(INST_ARCHLIB)/Tk/demos/widtrib/$widtrib") if $widtrib;

Tk::MMutil::TkExtMakefile(
    NAME          => "Tk::MatchEntry",
    DISTNAME      => "Tk-MatchEntry",
    VERSION_FROM  => "MatchEntry.pm",
    ABSTRACT => 'Entry widget with auto-completion capability',
    AUTHOR   => 'Wolfgang Hommel (wolf@code-wizards.com)',
    PM            => {"MatchEntry.pm" => "\$(INST_LIBDIR)/MatchEntry.pm", %widtrib},
    dist          => {COMPRESS => 'gzip', SUFFIX => 'gz'},
);