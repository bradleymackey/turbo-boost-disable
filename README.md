# turbo-boost-disable

A shell wrapper around the kext to disable Turbo Boost, taken directly from Turbo Boost Switcher.

We have to use the direct Turbo Boost Switcher kext because for some reason, their kext can run on macOS, but we cannot sign our own version to work on macOS. They must have signed it with an Apple key or something?
Anyway, to get around having to use the crappy Turbo-Boost Switcher GUI, we take the core kext, which is directly enabled/disabled with the shell scripts in this repo. Enjoy!

## 1. Setup (Required)

Download the directory and place in your home folder (`~/turbo-boost-disable`).

Create a password environment variable file, called `set-password-env.sh`.
This is so we don't have to ask for your login password on each login.
This password should be your `sudo` password, which is probably the same as your computer login password.
```sh
#!/bin/sh
LOGIN_PASSWORD="yourpasswordhere"
```
The password is temporarily loaded as an environment variable while we need it. We unload it afterwards when you call `start.sh`.

Make all the scripts executable:
```sh
chmod +x [ALL SCRIPTS]
```

You can now choose automatic control or manual control to disable Turbo Boost.

## 2a. Automatic Control (suggested)
Reset Turbo Boost status (ensure enabled, which should run on every login). This can be easily automated on your given system.
For example, I recommend using `sleepwatcher`, a good tool for running scripts on unlock on macOS.
```sh
./start.sh
```
This is the suggested way of using this software because after unlock the kext will stop working for some reason.
Therefore, this needs to be called on **every unlock**.

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
$ echo "./turbo-boost-disable/start.sh" >> ~/.wakeup
```

This will be called each time the computer starts!

## 2b. Manual Control
These scripts probably require a `sudo` password on each run, but are useful for one-off enables or disables.

Disable Turbo Boost:
```sh
./load.sh
```

Enable Turbo Boost:
```sh
./unload.sh
```

Bear in mind that after enabling, it probably will auto-disable after the next computer unlock.

## Licence
This software fundamentally relies on the TurboBoost Switcher kext, embedded in [this repository](https://github.com/rugarciap/Turbo-Boost-Switcher).
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

## Why?
My 2018 MacBook Pro runs hot. Most of the time. 
It's well known that integrated circuits last longer if they are not stressed out as much during their life.
That means (relatively) cool operation most of the time. 

I love Turbo Boost Switcher but was being constantly bombared with at least 3 login prompts every time I unlocked my computer.
There were no workarounds for this as far as I could tell, so I wrote this simple wrapper so I'll never have to see another one of those damn prompts again.
