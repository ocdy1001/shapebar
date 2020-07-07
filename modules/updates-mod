#!/bin/sh
#https://github.com/polybar/polybar-scripts/blob/master/polybar-scripts/updates-arch-combined/updates-arch-combined.sh
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
    updates_aur=0
fi

echo -n $updates_arch
echo -n ' ↑ '
echo $updates_aur
