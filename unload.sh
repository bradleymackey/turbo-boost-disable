#!/bin/sh

# Re-enables turbo boost by disabling the kext that enabled it

echo "Checking if Turbo Boost is enabled..."

result=`kextstat | grep -c com.rugarciap.DisableTurboBoost`
if [ $result -gt 0 ]
then 
    echo "[Found kext to disable]"
    echo 
    echo "Disabling now..."
else
    echo "No kext to disable."
    exit 0
fi

sudo /sbin/kextunload -v DisableTurboBoost.64bits.kext 
