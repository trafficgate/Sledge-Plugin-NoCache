package Sledge::Plugin::NoCache;
# $Id$
#
# Tatsuhiko Miyagawa <miyagawa@edge.co.jp>
# Livin' On The EDGE, Limited.
#

use strict;
use vars qw($VERSION);
$VERSION = 0.02;

sub import {
    my $class = shift;
    my $pkg   = caller(0);
    if ($_[0] && uc($_[0]) eq 'POST') {
	$pkg->register_hook(
	    AFTER_INIT => sub {
		my $self = shift;
		$self->set_no_cache if $self->is_post_request;
	    },
	);
    }
    no strict 'refs';
    *{"$pkg\::set_no_cache"} = \&set_no_cache;
}

sub set_no_cache {
    my $self = shift;
    $self->r->header_out(Pragma => 'no-cache');
    $self->r->header_out('Cache-Control' => 'no-cache');
}

1;

__END__

=head1 NAME

Sledge::Plugin::NoCache - plugin to add no-cache HTTP response

=head1 SYNOPSIS

  package Your::Pages;
  use Sledge::Plugin::NoCache;

  sub dispatch_foo {
      my $self = shift;
      $self->set_no_cache;
  }

  # always no-cache on POST request
  use Sledge::Plugin::NoCache 'POST';

=head1 DESCRIPTION

C<no-cache> ヘッダを吐きだすメソッド C<set_no_cache> を提供するプラグインです。

=head1 AUTHOR

Tatsuhiko Miyagawa <miyagawa@edge.co.jp> with Sledge development team.

=head1 SEE ALSO

HTTP/1.1

=cut

