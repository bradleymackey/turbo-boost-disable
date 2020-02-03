#!/bin/sh

# disables turbo boost by enabling a pre-signed kext
# (taken from the core of TurboBoost Switcher, but avoids their crappy interface)


echo "Checking if Turbo Boost already enabled..."

results=`kextstat | grep -c com.rugarciap.DisableTurboBoost`
if [ $results -gt 0 ]
then
   echo "Turbo Boost already disabled!"
   exit 0
else 
    echo "[Not Enabled]"
    echo
    echo "Enabling now..."
fi

sudo /usr/sbin/chown -R root:wheel DisableTurboBoost.64bits.kext
sudo /usr/bin/kextutil -v DisableTurboBoost.64bits.kext

echo "Turbo Boost disabled."
