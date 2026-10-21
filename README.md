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

## What It Does

### Grabs the start template

The script goes out and finds the template for a starter basic cross-development projects in github. It then clones it to the name your provided when you called the script.

### Setups the deploy scripts

Then the installer will ask you to try some ports that a uploading utility found to see if it can communicate with the F256K2.

If a good port is found it will setup the configuration files so that the project will deploy after it is built.

### Customizes the build script 

Then the script customizes the build.sh script in the project to use your project name as the main source file. It will also configure some other naming like:

* spr_<projectname>.bin will be used to store your sprites (up to 64)
* ts_<projectname>.bin will be used to store your tileset
* bmp_<projectname>.bin will be used to store a bitmap
* pal_<projectname>.pal will be used to store the bitmaps palette file

These will be be configured automatically and loaded into the correct memory addresses in the <projectname>.bas file.

### All that left is to run the build

The build script won't automatically run the script, but it will tell you to cd into your dir and run it when you are ready.
