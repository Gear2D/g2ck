# The Gear2D Creation Kit (G2CK)

(This document is subject to many changes :)

Gear2D Creation Kit is a set of CMake scripts that, given a build toochain, can setup everything you need to start creating your own game using Gear2D.

It assumes you have a **build environment** available and **[CMake]** installed, so, before you start, go get them.

- If you're using Apple-made operating systems, you'll want Xcode with gcc.
- If you're using Windows, I highly recommend [TDM-GCC] and and the IDE of your choice.
- If you're using Linux, use your package-manager to set it up for you.

Ready?

## Target layout

G2CK will create an environment prepared for you to create games, components, deploy packages, etc. The resulting layout when running g2ck scripts is the following:

     - /top-level/
       - g2ck/:                    this folder with g2ck scripts
       - g2ck-build/:              g2ck build folder.
       - external/:                dependencies, tools, etc. Everything required but not found on your system will
                                   be installed here.
       - games/:                   game folders created by means of g2ck (make new-game)


## Stage 0: Bootstraping

Make sure you have CMake and your build environment ready, you are going to need them.

Create a `g2ck-build` folder in the parent folder that this file is. Every interaction you'll do with G2CK will happen inside this folder.

After you're inside the `g2ck-build`, run cmake like this:

Linux and Mac:
    cmake ../g2ck
    
Windows:
    cmake -G "MinGW Makefiles" ../
    
First thing it will test if your environment is sane by compiling a test program.
Then, 
iIt will output some status messages, whether you have gear2d or not, its version, etc. After this, you're ready for [Stage 1](#stage-1)

## Stage 1: Gear2D


G2CK will check if you have Gear2D and Gear2D-Components already available. Manual installation of them will not be covered here, you might want to check [the Gear2D website](http://gear2d.com), maybe there's instructions there :)

If you chose not to install Gear2D beforehand, not to worry. We'll do it for you.

[CMake]: http://cmake.org/cmake/resources/software.html
[TDM-GCC]: http://tdm-gcc.tdragon.net/
