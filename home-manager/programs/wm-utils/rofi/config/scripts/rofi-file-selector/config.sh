#!/bin/bash
# MENU is the list of items that will be presented to the user
# Usefull when you have huge home directory which takes
# to long to scan and or when you want to be able to limit the search to some
# directories
# Defaults to :
# MENU=( home )
MENU=(personal work admin)

# For each item `X` defined in the MENU array, you have to define in `d_X` an
# array of directories which will be search for file with `fd`.
# You may also define `f_X` which is an array of file which will be added to
# the rofi menu.
# You may also define additional option to be passed to the `fd` tool in `o_X`
# arrays. See also `FD_OPTIONS` for global options.
#
# The array items will be subject to shell expansion.

d_personal=(~/Downloads ~/Documents ~/projects )
o_personal=(--exclude ~/Documents/tmp --exclude '*.pyc' --no-ignore)
d_work=(~/work/projects/web-* ~/work/accounting/ ~/Downloads ~/Models)
o_work=(--exclude '*.pyc' --no-ignore)
# f_work=(~/work/{til.md,account.ledger,time.ledger,log.md})
d_admin=(~/admin ~/Downloads /var/log/)

# Options pass to `fd` in addition to the one specified in `o_X` variables
FD_OPTIONS=(--follow --no-ignore)
