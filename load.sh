#!/usr/bin/env sh
# disables turbo boost by enabling a pre-signed kext
# (taken from the core of TurboBoost Switcher, but avoids their crappy interface)

echo "Checking if Turbo Boost already disabled..."
results=`kextstat | grep -c com.rugarciap.DisableTurboBoost`
if [ $results -gt 0 ]
then
    echo "Found kext com.rugarciap.DisableTurboBoost"
    echo "Turbo Boost already disabled!"
    exit 0
fi
echo "[TurboBoost is currently enabled]"
echo
echo "Disabling TurboBoost now..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
KEXT=$DIR/kext/DisableTurboBoost.64bits.kext
sudo /usr/sbin/chown -R root:wheel $KEXT
sudo /usr/bin/kextutil -v $KEXT

echo "Turbo Boost disabled."
