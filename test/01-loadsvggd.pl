#!/usr/bin/perl -w
use strict;
use GD;
use SVG::GD;

my $steps = 5;
print "Creating an SVG::GD Image\n";
my ($width,$height) = (200,200);
my $dwg = new GD::Image($width,$height);

exit 0 unless $dwg;
print "1/$steps: Allocating colours with colorAllocate\n";
my $col0 = $dwg->colorAllocate(1,3,200);
my $col1 = $dwg->colorAllocate(24,54,254);
my $col2 = $dwg->colorAllocate(25,155,25);
my $col3 = $dwg->colorAllocate(255,0,0);
exit 0 unless (defined $col0 && defined $col1 && defined $col2);

print  "2/$steps: Creating a set of  closed circle\n";
my $tag1 = $dwg->arc(50, 50, 50,50,0,0,$col1);
my $tag2 = $dwg->arc(10, 10, 4, 10,0,0,$col2);

print "3/$steps: Creating a line and a filled rectangle\n";
my $tag3 = $dwg->rectangle(20,120,40,30,$col0);
my $tag4 = $dwg->filledRectangle(120,120,40,70,$col3);
print "4/$steps: Setting a number of pixels to random colours\n";
my @range = (0..500);
foreach  (@range) {
	my $c = $dwg->colorAllocate(
		int(rand(255)),
		int(rand(255)),
		int(rand(255))
	);

	$dwg->setPixel(
		int(rand($width)),
		int(rand($height)),
		$c
	);
	print "$c\n";
}

#draw a line
print "5/$steps: Drawing a line\n";
$dwg->line(180,20,70,170,$dwg->colorAllocate(25,10,175));

print "\n";
print "5/$steps: Rendering the drawing\n";
my $pngout =  $dwg->png;
my $wbmpout =  $dwg->wbmp($col3);
my $svgout = $dwg->svg;
my $pngfile = 'test/out.png';
my $wbmpfile = 'test/out.wbmp';
my $svgfile = 'test/out.svg';
if (-e $pngfile) {unlink $pngfile}  
if (-e $wbmpfile) {unlink $wbmpfile}  
if (-e $svgfile) {unlink $svgfile}  

##output png image
#open OUT,">$pngfile" 
#	|| die "Unable to open test output file '$pngfile'";

#binmode OUT;
#print OUT $pngout;
#close OUT;
#exit 0 unless -e $pngfile;

##output wbmp image
#open OUT,">$wbmpfile" 
#	|| die "Unable to open test output file '$wbmpfile'";

#binmode OUT;
#print OUT $wbmpout;
#close OUT;
#exit 0 unless -e $wbmpfile;

#output svg image
#open OUT,">$svgfile" 
#	|| die "Unable to open test output file '$svgfile'";
#print OUT $svgout;
close OUT;
exit 0 unless -e $svgfile;
print "Succesful. Exiting test\n";
exit 1;

