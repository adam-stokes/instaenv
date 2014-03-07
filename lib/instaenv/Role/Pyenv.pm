package instaenv::Role::Pyenv;

# ABSTRACT: pyenv role

use Path::Tiny;

use Moo;
use namespace::clean;
extends('instaenv::Base');

has '+install_path' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/yyuu/pyenv.git ~/.pyenv',
            dst  => path("~/.pyenv")
        };
    }
);

has '+plugin' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/yyuu/pyenv-virtualenv.git',
            dst =>
              $self->install_path->{dst}->child('plugins/pyenv-virtualenv')
        };
    }
);

has '+interpreter' => (
    is      => 'ro',
    default => 'python'
);

has '+shim_path' => (
    is      => 'ro',
    default => 'export PATH="$HOME"/.pyenv/bin:$PATH'
);

has '+init_str' => (
    is      => 'ro',
    default => 'eval "$(pyenv init -)"'
);

has '+env_name' => (
    is      => 'ro',
    default => 'pyenv'
);


1;
