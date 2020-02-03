# turbo-boost-disable

A shell wrapper around the kext to disable Turbo Boost, taken directly from Turbo Boost Switcher.

We have to use the direct Turbo Boost Switcher kext because for some reason, their kext can run on macOS, but we cannot sign our own version to work on macOS. They must have signed it with an Apple key or something?
Anyway, to get around having to use the crappy Turbo-Boost Switcher GUI, we take the core kext, which is directly enabled/disabled with the shell scripts in this repo. Enjoy!
