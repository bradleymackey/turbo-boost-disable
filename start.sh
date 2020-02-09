#!/bin/sh

echo "Starting now"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
$DIR/reset-turbo-status.exp $(cat $DIR/password) $DIR
echo "Completed"
