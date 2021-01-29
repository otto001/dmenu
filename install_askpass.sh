#! /bin/bash

file=~/.xinitrc
tmpfile=$(mktemp)
cp $file $tmpfile &&  awk -v x='export SUDO_ASKPASS' -v y='export SUDO_ASKPASS="/usr/local/bin/dmenu_pass"' '$0 == x {found=1} END {if(!found) print y} 1' $tmpfile > $file
rm $tmpfile

