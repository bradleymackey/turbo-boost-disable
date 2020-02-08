# turbo-boost-disable

A shell wrapper around the kext to disable Turbo Boost, taken directly from Turbo Boost Switcher.

We have to use the direct Turbo Boost Switcher kext because for some reason, their kext can run on macOS, but we cannot sign our own version to work on macOS. They must have signed it with an Apple key or something?
Anyway, to get around having to use the crappy Turbo-Boost Switcher GUI, we take the core kext, which is directly enabled/disabled with the shell scripts in this repo. Enjoy!

## Using

Create a password environment variable file, called `set-password-env.sh`.
This is so we don't have to ask for your login password on each login.
This password should be your `sudo` password, which is probably the same as your computer login password.
```sh
#!/bin/sh
LOGIN_PASSWORD="yourpasswordhere"
```
The password is temporarily loaded as an environment variable while we need it. We unload it afterwards when you call `start.sh`.

Enable the scripts:
```sh
chmod 777 [ALL SCRIPTS]
```

### Automatic Control
Reset Turbo Boost status (ensure enabled, which should run on every login). This can be easily automated on your given system.
For example, I recommend using `sleepwatcher`, a good tool for running scripts on unlock on macOS.
```sh
./start.sh
```

### Manual Control
Disable Turbo Boost:
```sh
./load.sh
```

Enable Turbo Boost:
```sh
./unload.sh
```

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
