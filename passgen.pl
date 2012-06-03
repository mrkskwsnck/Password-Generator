#!/usr/bin/env perl

# Password Generator
# reads an integer $foobar from STDIN and prints a random alphanumeric string to STDOUT with a length of $foobar characters

use strict;

srand();
my @chars = (0..9, 'A'..'Z', 'a'..'z');
my $password = undef;

my $length = undef;

do
{
	print 'n=';
	$length = <STDIN>;
}
until(defined($length) && $length =~ m/^\d+$/ && $length >= 3);

do
{
	$password = undef;
	
	for(my $i = 0; $i < $length; $i++)
	{
		$password .= $chars[rand(scalar(@chars))];
	}
}

while(!($password =~ m/\d/ && $password =~ m/[A-Z]/ && $password =~ m/[a-z]/));

my $possible_combinations = scalar(@chars) ** $length;

print "Password: ${password}${/}";
print "Possible combinations: ${possible_combinations}${/}";

if($^O eq 'MSWin32')
{
	system('PAUSE');
}
