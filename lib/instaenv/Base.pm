package instaenv::Base;

# ABSTRACT: Base env class
use Path::Tiny;

use Moo;
use namespace::clean;

=attr install_path

attribute for providing the installation requirements.

At minimum this would return

    { repo => 'git://', dst => 'local path' }

=cut

has 'install_path' => (is => 'ro');

=attr plugin

attribute for describing the plugin installed

At minimum this would return

    { repo => 'git://', dst => 'local path' }

=cut

has 'plugin' => (is => 'ro');

=attr interpreter

interpreter mapping

=cut

has 'interpreter' => (is => 'ro');

=attr shim_path

interpreter shim path

=cut

has 'shim_path' => (is => 'ro');

=attr init_str

shim initialization string

=cut

has 'init_str' => (is => 'ro');

=attr env_name

environment name

=cut

has 'env_name' => (is => 'ro');

=method BEGIN

Makes sure a configuration directory exists for us to work with

=cut

BEGIN {
    my $self = shift;
    path('~/.instaenv')->mkpath unless path('~/.instaenv')->exists;
}

=method install_env

Installs the environment or will attempt to upgrade if paths exists

=cut

sub install_env {
    my $self = shift;
    system(
        sprintf(
            "git clone %s %s > /dev/null 2>&1",
            $self->install_path->{repo},
            $self->install_path->{dst}->absolute
        )
    ) unless $self->install_path->{dst}->exists;
    system(
        sprintf(
            "git clone %s %s > /dev/null 2>&1",
            $self->plugin->{repo},
            $self->plugin->{dst}->absolute
        )
    ) unless $self->plugin->{dst}->exists;
    $self->cleanup;
}

=method upgrade_env

Upgrades environments

=cut

sub upgrade_env {
    my $self = shift;
    system(
        sprintf("cd %s && git pull > /dev/null 2>&1",
            $self->install_path->{dst}->absolute)
    );
    system(
        sprintf("cd %s && git pull > /dev/null 2>&1",
            $self->plugin->{dst}->absolute)
    );
    printf("Environment: %s, updated.\n", $self->env_name);
}

=method cleanup

Cleans up, prints out what you need to add to $SHELL profile. Override
in respective env classes.

=cut

sub cleanup {
    my $self = shift;
    printf(
        "Environment %s installed. Add the "
          . "following to either ~/.profile or ~/.zshrc\n\n",
        $self->env_name
    );
    printf("%s\n",   $self->shim_path);
    printf("%s\n\n", $self->init_str);
    print("Then run the following: exec \$SHELL -l\n");
}


1;
