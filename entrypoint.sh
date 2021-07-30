#!/bin/bash

# Note that this does not use pipefail
# because if the grep later doesn't match any deleted files,
# which is likely the majority case,
# it does not exit with a 0, and I only care about the final exit.
set -eo

mkdir static
chown -R root:root *
npm install
composer install
npx crafty run --verbose
/usr/local/bin/daux generate