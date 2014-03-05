package instaenv;
# ABSTRACT: instaenv quick, dirty, and objectionable.

=head1 SYNOPSIS

    # Installing different environments

    $ instaenv i plenv
    $ instaenv i pyenv
    $ instaenv i rbenv
    $ instaenv i --all

    # Installing a seeded environment

    # ~/.instaenv.yml
    plenv:
      5.18.2:
        as: 'latest-stable'

    $ instaenv i
    ( Reading from ~/.instaenv.yml; Installing... )

=cut

use App::Cmd::Setup -app;

1;

=head1 DESCRIPTION

Installing environments made ez-pz.

