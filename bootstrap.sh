#!/bin/sh

STOW=`which stow`
TARGETS=`find . -maxdepth 1 -type d -regex '\./[^.]*$'`

for target in $TARGETS; do
	$STOW -vv "${target#./}"
done

echo "Done!"
