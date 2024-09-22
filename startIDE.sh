#!/bin/bash
#
# Start CuisApp IDE
#

imagePath=CuisImage
# Cuis  release
release=`cat CuisApp/cuisRelease`
# version number, when dealing with rolling release
version=`ls $imagePath/Cuis$release-????.image | cut -d - -f 2 | cut -d . -f 1`
if [ -z "$version" ]
then
    cuis=Cuis$release
else
    cuis=Cuis$release-$version	
fi

ide=CuisAppIDE
VM=CuisVM.app/Contents/Linux-x86_64/squeak

# Clean up from previous session
cd $imagePath
rm $ide.image $ide.changes $ide.user.* *.log
cp $cuis.image $ide.image
cp $cuis.changes $ide.changes
cd -

$VM $imagePath/$ide -s CuisApp/src/setupIDE.st
