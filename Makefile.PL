use 5.008;
use ExtUtils::MakeMaker;
use Config;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
    NAME              => 'SVG::GD',
    VERSION_FROM      => 'lib/SVG/GD.pm', # finds $VERSION
    PREREQ_PM         => {SVG=>2.30,
				SVG::Parser=>0.9,
			  GD=>0},
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (#ABSTRACT_FROM  => 'lib/Device/Velleman/K8055/Fuse.pm', # retrieve abstract from module
       AUTHOR         => 'Ronan Oger<ronan@cpan.org>') : ()),
);

