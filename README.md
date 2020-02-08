# turbo-boost-disable

A shell wrapper around the kext to disable Turbo Boost, taken directly from Turbo Boost Switcher.

We have to use the direct Turbo Boost Switcher kext because for some reason, their kext can run on macOS, but we cannot sign our own version to work on macOS. They must have signed it with an Apple key or something?
Anyway, to get around having to use the crappy Turbo-Boost Switcher GUI, we take the core kext, which is directly enabled/disabled with the shell scripts in this repo. Enjoy!

## Using

Create a password environment variable file, called `set-password-env.sh`.
This is so we don't have to ask for your login password on each login.
```sh
#!/bin/sh
LOGIN_PASSWORD="yourpasswordhere"
```

Enable the scripts:
```sh
chmod 777 [ALL SCRIPTS]
```

### Automatic Control
Reset Turbo Boost status (ensure enabled, which should run on every login). This can be easily automated on your given system.
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
