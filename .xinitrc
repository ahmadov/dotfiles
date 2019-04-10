#! /bin/bash
xrdb -merge ~/.Xresources
wal -R
exec i3
