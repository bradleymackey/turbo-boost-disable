#!/bin/sh

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

echo "[Not Enabled]"
echo
echo "Enabling now..."

sudo /usr/sbin/chown -R root:wheel DisableTurboBoost.64bits.kext
sudo /usr/bin/kextutil -v DisableTurboBoost.64bits.kext

echo "Turbo Boost disabled."
