#!/bin/bash
#
# Start CuisApp IDE
#

# Cuis Version release
cuisVersion=`cat CuisApp/cuisVersion`
imageFolder=CuisImage
cuis=Cuis$cuisVersion
ide=CuisAppIDE
VM=CuisVM.app/Contents/Linux-x86_64/squeak

# Clean up from previous session
cd $imageFolder
rm $ide.image $ide.changes $ide.user.* *.log
cp $cuis.image $ide.image
cp $cuis.changes $ide.changes
cd -

$VM $imageFolder/$ide -s CuisApp/src/setupIDE.st
