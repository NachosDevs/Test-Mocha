package Test::Magpie;
# ABSTRACT: Spy on objcets to achieve test doubles (mock testing)
use strict;
use warnings;

use aliased 'Test::Magpie::Mock';
use aliased 'Test::Magpie::Spy';
use aliased 'Test::Magpie::When';

use Moose::Util qw( find_meta );

use Sub::Exporter -setup => {
    exports => [qw( mock when verify )]
};

sub verify {
    my $mock = shift;
    return Spy->new(mock => $mock, @_);
}

sub mock {
    return Mock->new;
}

sub when {
    my $mock = shift;
    return When->new(mock => $mock);
}

1;