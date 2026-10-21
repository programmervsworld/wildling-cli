# Wildling CLI

This very small bash cli tool was designed to help me start up Foenix/Wildbits F256K2 basic projects. It has slowly started to grow a bit and is starting to get new features all the time.

## Usages
In order to use this script you must have you F256K2 powered on and the USB plug in. There are steps in the install where you will try some ports to find your device.

To start a basic project just grab the script from source control:

```bash
curl https://raw.githubusercontent.com/programmervsworld/wildling-cli/refs/heads/main/wildling.sh > wildling.sh
chmod +x wildling.sh

./wildling <your project name>
```

The cd into your project and type:

```bash
./build.sh
```

You project should deploy all the sprites and images first and then a basic program to test.


