package App::Ack::Filter::IsPath;

=head1 NAME

App::Ack::Filter::IsPath

=head1 DESCRIPTION

Filters based on path.

=cut

use strict;
use warnings;
use parent 'App::Ack::Filter';

use App::Ack::Filter::IsPathGroup;

sub new {
    my ( $class, $filename ) = @_;

    return bless {
        filename => $filename,
        groupname => 'IsPathGroup',
    }, $class;
}

sub create_group {
    return App::Ack::Filter::IsPathGroup->new();
}

sub filter {
    my ( $self, $file ) = @_;

    return $file->name eq $self->{filename};
}

sub inspect {
    my ( $self ) = @_;

    return ref($self) . ' - ' . $self->{filename};
}

sub to_string {
    my ( $self ) = @_;

    return $self->{filename};
}

1;
