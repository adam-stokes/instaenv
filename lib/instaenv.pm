package instaenv;
# ABSTRACT: instaenv quick, dirty, and objectionable.

=head1 SYNOPSIS

    # Installing
    $ instaenv i plenv
    $ instaenv i pyenv
    $ instaenv i rbenv
    $ instaenv i --all

    # Upgrading
    $ instaenv u plenv
    $ instaenv u rbenv
    $ instaenv u pyenv

=cut

use App::Cmd::Setup -app;

1;

=head1 DESCRIPTION

Installing environments made ez-pz.

=head1 USAGE

Add
L<instaenv|https://github.com/battlemidget/instaenv/blob/master/instaenv>
script to your B<PATH> and make executable.

Everything is included so no deps other than a perl interpreter.
