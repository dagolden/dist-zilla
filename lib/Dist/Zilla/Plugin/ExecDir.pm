package Dist::Zilla::Plugin::ExecDir;
# ABSTRACT: install a directory's contents as executables
use Moose;

use Moose::Autobox;

=head1 SYNOPSIS

In your F<dist.ini>:

  [ExecDir]

=cut

has dir => (
  is   => 'ro',
  isa  => 'Str',
  default => 'bin',
);

sub find_files {
  my ($self) = @_;

  my $dir = $self->dir;
  my $files = $self->zilla->files->grep(sub { index($_->name, "$dir/") == 0 });
}

with 'Dist::Zilla::Role::ExecFiles';
__PACKAGE__->meta->make_immutable;
no Moose;
1;
