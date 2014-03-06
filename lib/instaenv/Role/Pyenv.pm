package instaenv::Role::Pyenv;

# ABSTRACT: pyenv role

use Path::Tiny;

use Moo;
use namespace::clean;
extends('instaenv::Base');

has 'install_path' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/yyuu/pyenv.git ~/.pyenv',
            dst  => path("~/.pyenv")
        };
    }
);

has 'plugin' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/yyuu/pyenv-virtualenv.git',
            dst =>
              $self->_install_path->dst->child('plugins/pyenv-virtualenv')
        };
    }
);

1;
