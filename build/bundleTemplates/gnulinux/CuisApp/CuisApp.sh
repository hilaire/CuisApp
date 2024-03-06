#!/bin/bash

# Uncomment for composed key-in input
#COMPO="-compositioninput"

# Path
ROOT=`readlink -f $(dirname $0)`
APP=`dirname "$0"`
APP=`cd "$APP";pwd`
VM="$APP/VM/Linux-x86_64"
RESOURCES="$APP/Resources"

image="$RESOURCES/image/app"
NB_ARG=$#

# Icon (note: gvfs-set-attribute is found in gvfs-bin on Ubuntu
# systems and it seems to require an absolute filename)
gvfs-set-attribute \
	"$0" \
	"metadata::custom-icon" \
	"file://$RESOURCES/icons/app.png" \
	2> /dev/null

makeAbsolute () {
    if [[ "${1:0:1}" == "/" ]] 
    then
	filename="$1"
    else
	filename=`pwd`"/$1"
    fi
}

# execute
exec "$VM/squeak" $COMPO \
    --plugins "$VM" \
    --encoding utf-8 \
    -vm-display-X11 \
    --title "Cuis App" \
    "$image" \
    -d "Smalltalk at: #home put: '$HOME' asDirectoryEntry"



    
