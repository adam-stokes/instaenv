package instaenv::Role::Plenv;

# ABSTRACT: plenv role

use Path::Tiny;
use Moo;
use namespace::clean;
extends('instaenv::Base');

has 'install_path' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/tokuhirom/plenv.git',
            dst  => path("~/.plenv")
        };
    }
);

has 'plugin' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/tokuhirom/Perl-Build.git',
            dst  => $self->_install_path->dst->child('plugins/perl-build')
        };
    }
);

1;
