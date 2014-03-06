package instaenv::Role::Rbenv;

# ABSTRACT: rbenv role

use Path::Tiny;

use Moo;
use namespace::clean;
extends('instaenv::Base');

has 'install_path' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/sstephenson/rbenv.git',
            dst  => path("~/.rbenv")
        };
    }
);

has 'plugin' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/sstephenson/ruby-build.git',
            dst  => $self->_install_path->dst->child('plugins/ruby-build')
        };
    }
);

1;
