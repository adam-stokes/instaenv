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
L<instaenv|https://raw.github.com/battlemidget/instaenv/master/instaenv>
script to your B<PATH> and make executable.

For example,

    $ wget https://raw.github.com/battlemidget/instaenv/master/instaenv -O ~/bin/instaenv
    $ chmod +x ~/bin/instaenv
    $ instaenv i plenv

Everything is included so no deps other than a perl interpreter.
