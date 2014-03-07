package instaenv::Role::Rbenv;

# ABSTRACT: rbenv role

use Path::Tiny;

use Moo;
use namespace::clean;
extends('instaenv::Base');

has '+install_path' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/sstephenson/rbenv.git',
            dst  => path("~/.rbenv")
        };
    }
);

has '+plugin' => (
    is      => 'ro',
    default => sub {
        my $self = shift;
        {   repo => 'git://github.com/sstephenson/ruby-build.git',
            dst  => $self->install_path->{dst}->child('plugins/ruby-build')
        };
    }
);

has '+interpreter' => (
    is      => 'ro',
    default => 'ruby'
);

has '+shim_path' => (
    is      => 'ro',
    default => 'export PATH="$HOME"/.rbenv/bin:$PATH'
);

has '+init_str' => (
    is      => 'ro',
    default => 'eval "$(rbenv init -)"'
);

has '+env_name' => (
    is      => 'ro',
    default => 'rbenv'
);


1;
