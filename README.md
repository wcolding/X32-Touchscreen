# X32 Touchscreen

This project is scaffolding for creating custom touchscreen interfaces for use with Behringer X32 series mixers.

It is intended for use in unscripted production audio environments in which it is necessary to generate multiple submixes from various audio sources, such as mixing lavs to different camera sends. It enables the operator to toggle channels on and off of mixbuses with a simple button interface.

The scripts generate files that run in [TouchOSC](https://hexler.net/touchosc), control interface software that supports Windows, macOS, Linux, iOS and Android platforms. For the best experience a desktop environment with a large touchscreen is recommended.

## Requirements

Python 3.10+

## Quick Start

[pyTOSC](https://github.com/wcolding/pyTOSC) is included as a submodule to this project, and it contains the Python scripts to build files. To properly install pyTOSC, simply clone this repository with the `--recurse-submodules` flag, i.e.:

`git clone https://github.com/wcolding/X32-Touchscreen.git --recurse-submodules`

It should then be possible to make changes to the configuration files. To build it, run `python pyTOSC.py -b` and a .tosc file should be created in the `Build` directory.

Further information can be found in the wiki.
