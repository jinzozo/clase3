#!/usr/bin/perl -w
#Para obtener los vina scores siguiendo una lista
use strict;
use warnings;


my @files = <*.pdbqt>;


#Tu lista con los ids con sus prefijos de ser necesarios.
my $list = $ARGV[0];
open (DATA, $list);
my @input = <DATA>;
close(DATA);
chomp @input;
my $input = join('', @input);




foreach (my $i = 0; $i< scalar(@files); $i++)
    {
    if ($input =~ $files[$i])
        {
        open(FILE, $files[$i]) or die "cannot open";
        my @cont = <FILE>;
        chomp(@cont); 
        for my $j (@cont)
            {
            my $id = $files[$i];
            $id =~ s/out_//g;
            $id =~ s/.pdbqt//g;
            if ($j =~ "REMARK VINA RESULT:")
                {
                my $str = substr($j,25,5);
                print "$id\t$str\n";
                }
            }       
        }
    }

 
