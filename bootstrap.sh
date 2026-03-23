#!/bin/sh

###############################################################################
# Initialization
#
usage() {
	echo "Usage: $0 [-d|--delete]"
	echo "  -d, --delete    Delete (unstow) symlinks instead of creating them"
	exit 1
}

# The actual options.
STOW_ACTION=""

# Go through all the passed parameters.
for arg in "$@"; do
	case "$arg" in
	-d | --delete) STOW_ACTION="-D" ;;
	*) usage ;;
	esac
done

# Ensure the current directory is the directory where the script is located.
cd "$(dirname "$0")" || exit 1

# Check if stow exists.
if ! command -v stow >/dev/null 2>&1; then
	echo "Error: GNU Stow is not installed."
	exit 1
fi

###############################################################################
# ACTION!
#
echo "Initializing submodules..."
git submodule update --init --recursive

if [ -n "$STOW_ACTION" ]; then
	echo "Unstowing packages..."
else
	echo "Stowing packages..."
fi

# Enumerate stow targers.
TARGETS=$(find . -maxdepth 1 -type d -regex '\./[^.]*$')

# Stow each target.
for target in $TARGETS; do
	package="${target#./}"
	if ! stow -vv $STOW_ACTION -t "$HOME" "$package"; then
		echo "Error: failed to stow '$package'. A conflicting file may already exist."
		exit 1
	fi
done

echo "Done!"
