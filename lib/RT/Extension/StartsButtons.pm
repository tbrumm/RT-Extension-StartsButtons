use strict;
use warnings;
package RT::Extension::StartsButtons;

our $VERSION = '0.05';

$RT::Config::META{'StartsDateButtons'} = {
    Section         => 'Ticket display',
    Overridable     => 1,
    Widget          => '/Widgets/Form/Boolean',
    WidgetArguments => {
        Description => 'Display Starts Date Buttons at Dates Widget', # loc
        Hints       => '(' . __PACKAGE__ . ')',
    },
};

=head1 NAME

RT-Extension-StartsButtons - shortcut buttons to quickly set Starts dates for ticket

=head1 DESCRIPTION

After installing this extension, on the ticket's page, you should see
new buttons to set the ticket Starts date. 

The +1d, +2d, +3d, +1w, +1m buttons will advance the current Starts date
for the ticket by the corresponding time amount. If the Starts date is not
set at the moment, they will assume today's date as the base for the
advancement.

The tomorrow, next monday and reset buttons will set the Starts date to
tomorrow, next monday or reset it respectively. 

All buttons except for the reset one will also set the ticket status to
Stalled. The reset button does not change the ticket status.

=head1 INSTALLATION 

=over

=item perl Makefile.PL

=item make

=item make install

May need root permissions

=item Edit your /opt/rt4/etc/RT_SiteConfig.pm

Add this line:

    Set(@Plugins, qw(RT::Extension::StartsButtons));

or add C<RT::Extension::StartsButtons> to your existing C<@Plugins> line.

Optionally change the default settings described in L</CONFIGURATION>
below.

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 CONFIGURATION

=head2 $StartsButtonsStall

    Set( $StartsButtonsStall, 1 ); # default
    Set( $StartsButtonsStall, 0 );

By default, changing the Starts date results in the ticket being
stalled.  To keep the current status, set this to a defined but false
value.

=head2 $StartsButtonsShowTopRow

    Set( $StartsButtonsShowTopRow, 1 ); # default
    Set( $StartsButtonsShowTopRow, 0 );

By default, the top row of buttons (for changing the Starts date
relatively) is shown.  To hide it, set this to a defined but false
value.

=head2 $StartsButtonsBottomButtons

    # default
    Set( $StartsButtonsBottomButtons, [
        # label      => form value
        [ 'tomorrow' => 'tomorrow'    ],
        [ 'Monday'   => 'next Monday' ],
    ] );

    Set( $StartsButtonsBottomButtons, [
        # label      => form value
        [ 'tomorrow' => '12am tomorrow'      ],
        [ 'Saturday' => '12am next Saturday' ],
        [ 'Monday'   => '12am next Monday'   ],
    ] );

By default, the bottom row of buttons (excluding the final "reset"
button) features a "tomorrow" button to set the Starts date to
"tomorrow," and a "Monday" button to set the Starts date to "next
Monday."  To customise these buttons, set this accordingly in the
manner shown above.

The "label" is the value shown on the button in the interface.  The
"form value" is what an RT user would enter into the Starts field on
the Dates page.

=head2 $StartsButtonsResetLabel

    Set( $StartsButtonsResetLabel, 'reset' );                   # default
    Set( $StartsButtonsResetLabel, "\N{MULTIPLICATION SIGN}" ); # "x"
    Set( $StartsButtonsResetLabel, '' );                        # hide button

By default, the final button on the bottom row is labelled "reset" and
removes the Starts date.  To change this button's label, set this value
to a non-empty string.  To hide this button, set this value to an empty
string.

=head1 AUTHOR

Torsten Brumm <tbrumm@mac.com> and Alex Peters <lxp@cpan.org>, based on
original idea from Daniel De Marco <ddm@didiemme.net>

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2014 by Best Practical Solutions, LLC.

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
