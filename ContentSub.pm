package ContentSub;

use strict;
use warnings;
use utf8;

my $tmplDir;

BEGIN {
  my $path = __FILE__;
  $path =~ s{[^/]+$}{};
  if (not $path) {$path = '.';}
  $tmplDir = $path . '/';
}

my %templates = (
  Makefile => "makefile.tmpl",
  'common.in' => 'common_in.tmpl',
  'libs.in' => 'libs_in.tmpl',
  'MakefileLib' => 'makefile_lib.tmpl',
  'main.cpp' => 'main_cpp.tmpl',
);

sub getTemplate {
  my $template = shift;
  open (my $fh, "<", $tmplDir . $templates{$template}) or die $! . $template . "\n";
  my $content = '';
  while (my $str = <$fh>) {$content .= $str;}
  close $fh;
  return $content;
}
sub Makefile {
  return getTemplate ('Makefile');
}

sub common_in {
  return getTemplate ('common.in');
}

sub libs_in {
  return getTemplate ('libs.in');
}

sub MakefileLib {
  return getTemplate ('MakefileLib');
}

sub main_cpp {
  return getTemplate ('main.cpp');
}

1;
