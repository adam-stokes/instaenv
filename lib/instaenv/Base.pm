package instaenv::Role;
use Moo;

=attr install_path

attribute for providing the installation requirements.

At minimum this would return

    { repo => 'git://', dst => 'local path'}

=cut

has '+install_path' => (
    is      => 'rw',
);

=attr plugin

attribute for describing the plugin installed

At minimum this would return

    { repo => 'git://', dst => 'local path'}

=cut

has '+plugin' => (
    is      => 'rw',
);

=method install_env

Installs the environment or will attempt to upgrade if paths exists

=cut

sub install_env {
    my $self = shift;
    if (   $self->_install_path->{dst}->exists
        && $self->_install_path->{dst}->child('.git')->exists)
    {
        system(
            sprintf(
                "cd %s && git pull", $self->_install_path->{dst}->abspath
            )
        );
    }
    else {
        system(
            sprintf("git clone %s %s",
                $self->_install_path->{repo},
                $self->_install_path->{dst}->abspath)
        );
    }

    if (   $self->_plugin->{dst}->exists
        && $self->_plugin->{dst}->child('.git')->exists)
    {
        system(sprintf("cd %s && git pull", $self->_plugin->{dst}->abspath));
    }
    else {
        system(
            sprintf("git clone %s %s",
                $self->_plugin->{repo},
                $self->_plugin->{dst}->abspath)
        );
    }
}

1;
