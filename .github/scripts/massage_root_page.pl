#!/usr/bin/perl

use strict;
use warnings;

sub main();

main();

sub main()
{
  my $MAIN = 'main';
  (@ARGV >= 3) or die("Usage: \$0 <version> <target root page file> <product name: e.g.: `Flow-IPC` or `Flow`>\n");

  my ($version, $file, $product) = @ARGV;

  my $ADDED = "  - Release **$product $version**: "
              . "[documentation](./doc/flow-ipc/versions/$version/index.html) \\| "
              . "[release info](https://not.real.yet/to-do/$version)"

  my $file_hndl;
  open($file_hndl, '<', $file) or die("Cannot open to read [$file]: error [$!].\n");

  my $out = ''; # Will write back to $file after scanning all of $file.
  my $massaging = 0; # Becomes true once `section BEGIN` is found; false again once `section END' found.
  my $massaged_section_out; # This starts empty; is constructed once $massaging; is output once !$massaging again.
  my $version_already_mentioned; # This starts false once $massaging; then set to true if $version found in $file.

  while (my $line = <$file_hndl>)
  {
    if ($massaging)
    {
      if ($line =~ /massage_root_page\.pl:$product section END/)
      {
        $massaging = 0;

        # OK, analyze what we've in massaged section.
        if (!$version_already_mentioned)
        {
          # $massaged_section_out contains the pre-massaged state of the massaged section (excluding terminator
          # $line which we haven't appended yet).
          # Since $version was not mentioned, we will add it at the end: that is really our reason for existing.
          # The only subtlety is that there might (will) be a bunch of blank stuff (lines) at the end, and we must
          # add the $version-mentioning line before that stuff.  Hence:
          ($massaged_section_out =~ s/\n\s*$/\n$ADDED\n\n/) or die("Unexpected massaged-section in [$file].\n");
        }
        # else if ($version_already_mentioned) { Nothing for us to to. }

        $massaged_section_out .= $line;
        $out .= $massaged_section_out;
      } # if ($line =~ /massage_root_page\.pl:$product section END/)
      else # if ($line is inside massaged section and not its end-marker)
      {
        $massaged_section_out .= $line;
        ($version_already_mentioned = 1) if ($line =~ /\Q$ADDED\E/);
      }
    } # if ($massaging)
    else # if (!$massaging)
    {
      $out .= $line;
      if (($version ne $MAIN) # We assume `main` lines are manually entered and do not change, hence no massaging.
          && ($line =~ /massage_root_page\.pl:$product section BEGIN/))
      {
        $massaging = 1;
        $massaged_section_out = '';
        $version_already_mentioned = 0;
      }
    } # else # if (!$massaging)
  } # while (my $line = <$file_hndl>)

  close($file_hndl);
  $massaging and die("Malformed input file: [$product section BEGIN] has no END counterpart.\n");

  open($file_hndl, '>', $file) or die("Cannot open to write [$file]: error [$!].\n");
  (print $file_hndl $out) or die("Cannot write to [$file]: error [$!].\n");
  close($file_hndl);
} # sub main
