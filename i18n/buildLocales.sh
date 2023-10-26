#!/bin/sh

# Compile the translations .po to .mo files to be distributed with the
# application

PODIR="po"
MODIR="locale"

LANG="fr"

# clean up
rm -rf $MODIR

# Compile .po files
#
for l in $LANG; do
    mkdir -p $MODIR/$l/LC_MESSAGES
    msgfmt $PODIR/$l.po -o $MODIR/$l/LC_MESSAGES/cuisapp.mo
done

