#!/usr/bin/env sh
# runs a full cycle for ensuring that turbo-boost is in fact disabled

echo "[Attempting disable Turbo Boost]"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# read the sudo password from the local file that has been created, also pass the current directory
$DIR/reset-turbo-status.exp $(cat $DIR/password) $DIR
echo "[Turbo Boost disabled.]"
