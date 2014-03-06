package instaenv::Command::i;

# ABSTRACT: play that funky music

use instaenv -command;
use Class::Load ':all';
use DDP;

use Moo;
use namespace::clean;

sub opt_spec {
    return (["all", "install all environments [pl,py,rb]envs"]);
}

sub abstract {'Install all or any supported environments.'}

sub usage_desc {'%c i {py,pl,rb}env'}

sub validate_args {
    my ($self, $opt, $args) = @_;
    $self->usage_error("Don't understand that environment :(")
      unless $opt->{all} || $args->[0] =~ /^plenv|rbenv|pyenv/;
}

sub execute {
    my ($self, $opt, $args) = @_;

    if ($opt->{all}) {
        printf("Installing all envs\n");
    }
    else {
      SWITCH: {
            for ($args->[0]) {
                if (/^plenv/) {
                    my $ie = load_class('instaenv::Role::Plenv')->new;
                    $ie->install_env;
                    last SWITCH;
                }
                if (/^rbenv/) { 
                    my $ie = instaenv::Role::Rbenv->new;
                    $ie->install_env;
                    last SWITCH;
                if (/^pyenv/) { printf("Installing pyenv\n"); last SWITCH; }
                $_ = 1;
            }
        }
    }
}

1;
