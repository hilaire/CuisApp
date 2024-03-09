#!/bin/sh

# Update the .po files from a newer .pot file

cd po

lang="fr ia"

for l in $lang; do
    msgmerge -U $l.po cuisapp.pot
done

cd -
