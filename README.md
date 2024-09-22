# CuisApp

A template repository to develop Cuis-Smalltalk application. In this
template you will learn:


- to set up your development space on disk

- to organize your code and data

- to build your IDE on Cuis (Bash and Smalltalk configuration scripts)

- about essential design patterns: MVP, Strategy, Command, Observer

- to localise your application

- to build an application bundle


You may want to [watch the related
speech](https://youtu.be/E3eDDSPCf7c?si=qUBf3i_fHnZCUX9t) with its
[companion
slides](https://github.com/hilaire/CuisApp/blob/main/resources/doc/smalltalk2023/gui-app.pdf)
presented at the Smalltalk 2023 Fast event in Buenos Aires. It
explains how to build step-by-step your developer environment and the
design of the Cuis application.

## Quick start-up

Alternatively, you can directly fetch the needed repositories
including the ready to use Cuis App template.

1. Set up your working environment

```bash
mkdir myProject
cd myProject
git clone https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev
git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI
git clone --depth 1 https://github.com/Cuis-Smalltalk/SVG
git clone --depth 1 https://github.com/Cuis-Smalltalk/Numerics
cd Cuis6-2
git clone http://github.com/hilaire/CuisApp
```

2. Start the CuisApp IDE
```bash
cd myProject/Cuis-Smalltalk-Dev
./CuisApp/startIDE.sh
```
3. Build the application bundle

```bash
cd myProject/Cuis-Smalltalk-Dev
# Build the application image
./CuisApp/build/makeBundle.sh --build
# Package a GNU/Linux bundle
./CuisApp/build/makeBundle.sh --package gnulinux
# Package a Windows bundle
./CuisApp/build/makeBundle.sh --package windows
```

The bundles are located at CuisApp/build/bundles. The resulting
application can be tested as well:

```bash
/CuisApp/build/bundles/gnulinux/CuisApp/CuisApp.sh
```

Happy hacking!
