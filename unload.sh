#!/bin/sh

# Re-enables turbo boost by disabling the kext that enabled it

echo "Checking if Turbo Boost is enabled..."

result=`kextstat | grep -c com.rugarciap.DisableTurboBoost`
if [ $result -eq 0 ]
then 
    echo "No kext to disable."
    echo "Turbo Boost is still enabled."
    exit 0
fi

echo "[Turbo Boost is currently enabled]"
echo 
echo "Unloading kext now..."

sudo /sbin/kextunload -v DisableTurboBoost.64bits.kext 

echo "Turbo Boost Enabled."
