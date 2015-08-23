#!/bin/bash

here=$(pwd)

for f in `ls src`
do
    if [ -f "src/$f" ]
    then
        if [ ! -f "$HOME/.$f" ]
        then
            ln -s "$here/src/$f" "$HOME/.$f"
        fi
    fi
done
