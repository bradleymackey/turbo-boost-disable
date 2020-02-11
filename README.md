# turbo-boost-disable

## Keep Out

This tool is **only a shell wrapper abusing system privilages** to wrap [Turbo Boost Switcher (TBS)](https://github.com/rugarciap/Turbo-Boost-Switcher) functionality behind the command line. You're probably better off using TBS to be honest. 

## Why?
My 2018 MacBook Pro runs hot most of the time. 
It's well known that integrated circuits last longer if they are not stressed out as much during their life.
That means (relatively) cool operation most of the time. 
Typing on a warm keyboard is also a deeply unpleasent experience.
I'm willing to have a bit of a hit in performance (about 20%) so that I can have a much nicer time using my computer.

I love TBS but was being constantly bombared with at least 3 login prompts every time I unlocked my computer.
There were no workarounds for this as far as I could tell, so I wrote this simple wrapper so I'll never have to see another one of those damn prompts again.

This program runs totally silently in the background and I never have to think about it; the same goes for my MacBook.
It's finally cool, calm, and lasts longer on battery life.

# Install

This is just a shell wrapper around a kext to disable Turbo Boost on 64-bit macOS, taken directly from [TBS](https://github.com/rugarciap/Turbo-Boost-Switcher).

We have to use the direct TBS kext because for some reason, their kext can run on macOS, but we cannot sign our own version to work on macOS. They must have signed it with an Apple key or something?
Anyway, to get around having to use the crappy Turbo-Boost Switcher GUI, we take the core kext, which is directly enabled/disabled with the shell scripts in this repo. Enjoy!

## 1. Setup (Required)

Download the directory and place in your home folder (`~/turbo-boost-disable`).

We need to run `load.sh` and `unload.sh` as root.
Therefore, modify your `/etc/sudoers` file to not require a password for these scripts.

Edit the sudoers file:
```sh
$ sudo visudo /etc/sudoers
```

Append these lines to `/etc/sudoers`, replacing `myusername` with your login username (use `whoami` to find this out):
```
myusername ALL= NOPASSWD: /Users/myusername/turbo-boost-disable/load.sh
myusername ALL= NOPASSWD: /Users/myusername/turbo-boost-disable/unload.sh
```

Ensure that `load.sh`, `unload.sh`, `start.sh` are only readable and executable, not writable (for security purposes).
```sh
$ sudo chmod a=rx *.sh
```

You can now choose automatic control or manual control to disable Turbo Boost.

## 2a. Automatic Control (suggested)
To ensure Turbo Boost is always disabled, we need to run `start.sh` every time the computer is unlocked.
This is because after unlock the kext will stop working (for some reason).

You can choose to do this yourself manually, but good luck remembering to do that every time.

This can be easily automated on macOS.
For example, I recommend using `sleepwatcher`, a good tool for running scripts after lock/unlock on macOS.
To install `sleepwatcher`, just use homebrew and start the service:
```sh
$ brew install sleepwatcher
$ brew services start sleepwatcher
```

Then create the wakeup script file at `~/.wakeup`:
```sh
$ touch ~/.wakeup
$ chmod +x ~/.wakeup
$ echo "#!/bin/sh" >> ~/.wakeup
$ echo "~/turbo-boost-disable/start.sh" >> ~/.wakeup
```

This will be called each time the computer is unlocked, and works well (for me at least).

## 2b. Manual Control (if you want)
These scripts probably require a `sudo` password on each run, but are useful for one-off enables or disables.

Disable Turbo Boost:
```sh
~/turbo-boost-disable/load.sh
```

Enable Turbo Boost:
```sh
~/turbo-boost-disable/unload.sh
```

Bear in mind that after enabling, it probably will auto-disable after the next computer unlock.
You should use the Automatic Control directions to ensure that Turbo Boost is always disabled.

## Licence
This software fundamentally relies on the TBS kernel extension (kext).
This repository is distributed under the GNU General Public Licence v2.0, of which the terms are:

```
Turbo Boost disabler / enable app for Mac OS X
Copyright (C) 2013  rugarciap

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```

In accordance with the terms of the licence, we are distibuting this software under the same licence.
We simply provide a non-GUI interface to interact with this kext.

Our licence:
```
turbo-boost-disable -- disable Turbo Boost from the command line
Copyright (C) 2020  Bradley Mackey

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```
