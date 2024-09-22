#!/bin/bash
#
# Build CuisApp image and package bundle
#
# Link the CuisAppo repository in the Cuis release folder.
# Execute the script from Cuis release folder.
# If necessary, in the Path section below, adjust cuisAppRepo, vmExec variables.
# Adjust below the rel variable to the wished CuisApp release number

# CuisApp release number
rel="1.0-alpha"

# Path
imagePath="./CuisImage"
cuisAppRepo="./CuisApp"
buildPath="$cuisAppRepo/build"
bundlesPath="$buildPath/bundles"
src="$cuisAppRepo/src"
resources="$cuisAppRepo/resources"

# Smalltalk image version
release=`cat $cuisAppRepo/cuisRelease`
# version number, when dealing with rolling release
version=`ls $imagePath/Cuis$release-????.image | cut -d - -f 2 | cut -d . -f 1`

if [ -z "$version" ]
then
    smalltalk=Cuis$release
else
    smalltalk=Cuis$release-$version	
fi
smalltalkSources=Cuis$cuisVersion.sources

# To build CuisApp we need:
# A Cuis image, its source, the virtual machine,
# the Smalltalk installation script and the CuisApp source

vmExec=CuisVM.app/Contents/Linux-x86_64/squeak
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
    mkdir $bundlesPath
    bundlePath="$bundlesPath/$1"
    bundleTemplate="$buildPath/bundleTemplates/$1"
    cuisVMPath="CuisVM.app/Contents"
    case "$1" in
	gnulinux)
	    bundleApp="$bundlePath/CuisApp"
	    cuisVM="Linux-x86_64"
	    destVM="VM"
	;;
	windows)
	    bundleApp="$bundlePath/CuisApp"
	    cuisVM="Windows-x86_64"
	    destVM="VM"
	;;
	mac)
	    bundleApp="$bundlePath/Cuis.app"
	    cuisVM="MacOS Resources"
	    # Subfolder Resources to be considered as well
	    destVM="Contents"
	;;
    esac
    bundleResources="$bundleApp/Resources"
    # INSTALL BUNDLES...
    rm -rf $bundlePath
    # ...template
    rsync -a --exclude '*~' $bundleTemplate $bundlesPath
    # ...doc
    cp $resources/doc/ChangeLog $bundleApp
    # ...icons
    rsync -a $resources/graphics/icons/* $bundleResources/icons
    # ...vm
    for i in $cuisVM
    do
	rsync -a $cuisVMPath/$i $bundleApp/$destVM/
    done    
    # ...Smalltalk Image
    rsync -a $imagePath/app.{image,changes} $bundleResources/image
    # ...Smalltalk Source
    rsync -a $imagePath/$smalltalkSources $bundleResources/image
    # ...locales
    rsync -a "$cuisAppRepo/i18n/locale" $bundleResources/image   
    # set exec flag
    case "$1" in
	gnulinux)
	    chmod +x $bundleApp/CuisApp.sh
	    chmod +x $bundleApp/VM/$cuisVM/squeak
	    ;;
	mac)
	    chmod +x $bundleApp/Contents/MacOS/Squeak
	    ;;
    esac    
   
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
