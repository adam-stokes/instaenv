package instaenv::Role::Plenv;

# ABSTRACT: plenv role

use Path::Tiny;
use Moo;
use namespace::clean;
extends('instaenv::Base');

has '+install_path' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/tokuhirom/plenv.git',
            dst  => path("~/.plenv")
        };
    }
);

has '+plugin' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/tokuhirom/Perl-Build.git',
            dst  => $self->install_path->{dst}->child('plugins/perl-build')
        };
    }
);

has '+interpreter' => (
    is      => 'ro',
    default => 'perl'
);

has '+shim_path' => (
    is      => 'ro',
    default => 'export PATH="$HOME"/.plenv/bin:$PATH'
);

has '+init_str' => (
    is      => 'ro',
    default => 'eval "$(plenv init -)"'
);

has '+env_name' => (
    is      => 'ro',
    default => 'plenv'
);

1;
