#!/bin/bash
#
# Build CuisApp image and package bundle
#
# Link the CuisAppo repository in the Cuis-Smalltalk-Dev folder.
# Execute the script from Cuis-Smalltalk-Dev folder.
# If necessary, in the Path section below, adjust cuisAppRepo, vmExec variables.
# Adjust below the rel variable to the wished CuisApp release number

# CuisApp release number
rel="23.12a-beta"

# Smalltalk image version
release=`ls Cuis6.0-????.image | cut -d - -f 2 | cut -d . -f 1`
smalltalk="Cuis6.0-$release"
smalltalkSources="CuisV6.sources"

# To build CuisApp we need:
# A Cuis image, its source, the virtual machine,
# the Smalltalk installation script and the CuisApp source

# Path
imagePath="."
cuisAppRepo="./CuisApp"
buildPath="$cuisAppRepo/build"
bundlesPath="$buildPath/bundles"
src="$cuisAppRepo/src"
resources="$cuisAppRepo/resources"
 
vmExec="../cogspur/squeak"
installScript="$src/install-image.st"



buildImage () {
    # INSTALL PACKAGE
    # prepare the app image
    rm $imagePath/app.*
    cp $imagePath/$smalltalk.image $imagePath/app.image
    cp $imagePath/$smalltalk.changes $imagePath/app.changes
    # install source code in the app image and configure it
    $vmExec $imagePath/app.image -s $installScript
    ls -lh $imagePath/app.image
    echo "--== DONE building CuisApp image ==--"    
}

copyToBundle () {
    # copy a built image to an existing gnulinux bundle (for quick testing)
    bundlePath="$bundlesPath/gnulinux"
    bundleApp="$bundlePath/CuisApp"
    bundleResources="$bundleApp/Resources"
    rsync -av $imagePath/app.{image,changes} $bundleResources/image
}

makeBundle () {
    # $1 OS target (gnulinux windows mac)
    # clean up the bundle space
    bundlePath="$bundlesPath/$1"
    if [[ "$1" == "gnulinux" || "$1" == "windows" ]]
    then
	bundleApp="$bundlePath/CuisApp"
    else
	bundleApp="$bundlePath/CuisApp.app"
    fi
    bundleResources="$bundleApp/Resources"
    bundleTemplate="$buildPath/vm/$1"
    
    rm -rf $bundlePath
    # install template
    rsync -a --exclude '.bzr' --exclude '*~' $bundleTemplate $bundlesPath
    cp $resources/doc/ChangeLog $bundleApp
    # install icons
    rsync -a $resources/graphics/icons/* $bundleResources/icons
    # install Smalltalk Image
    rsync -a $imagePath/app.{image,changes} $bundleResources/image
    # install Smalltalk Source
    rsync -a $imagePath/$smalltalkSources $bundleResources/image
    # install the locales
    rsync -a "$cuisAppRepo/i18n/locale" $bundleResources/image
    # set exec flag
    if [[ "$1" == "gnulinux" ]]
    then
	chmod +x $bundleApp/CuisApp.sh
	chmod +x $bundleApp/VM/squeak
    elif [[ "$1" == "mac" ]]
    then
	chmod +x $bundleApp/Contents/MacOS/squeak
    fi

    # Create an archive out of the bundle
    cd $bundlePath
    zip -r --symlinks -qdgds 5m CuisApp-$1-$rel.zip "`basename $bundleApp`" -x \*/.bzr/* \*~
    ls -sh CuisApp-$1-$rel.zip
    echo "--== DONE packaging CuisApp for $1 ==--"
    echo -n "Signing..."
    gpg --armor --sign --detach-sign CuisApp-$1-$rel.zip
    echo "...done."
    cd -
}

# Option
# Build image:
# $1 = --build
# Package from an already built image:
# $1 = --package , $2 = all | gnulinux | windows | mac
# Build image and package all bundles:
# $1 = --all
case "$1" in
    --build)
	buildImage
	;;
    --package)
	case "$2" in
	    all)
		makeBundle "gnulinux"
		makeBundle "windows"
		makeBundle "mac"
		;;
	    gnulinux)
		makeBundle "gnulinux"
		;;
	    windows)
		makeBundle "windows"
		;;
	    mac)
		makeBundle "mac"
		;;
	    *)
		echo -e "Unknow \"$2\" --package argument.\nValid arguments are gnulinux, windows, mac."
		;;
	esac
	;;
    --all)
	buildImage
	makeBundle "gnulinux"
	makeBundle "windows"
	makeBundle "mac"	
	;;
    --copy)
	copyToBundle
	;;
    --help|*)
	echo "Usage: makeBundle [OPTION] [ARGUMENT]"
	echo
	echo -e "--build\t\t\t\t\tBuild CuisApp image"
	echo -e "--package all|gnulinux|windows|mac\tPackage CuisApp with an already built image"
	echo -e "--all\t\t\t\t\tBuild image and package for all OS"
	echo -e "--copy\t\t\t\tCopy a built image to an existing gnulinux bundle"
	;;
esac
