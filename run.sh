#!/bin/sh

VERSION="0.1.0"

function usage() {
    echo 'Commands:'
    echo ' - pack - pack the assets to a zip file'
    echo ' - tag - add git tag with the current version'
}

function run_pack_assets() {
    ZIPFILE="consumers_assets-$VERSION.zip"
    rm -f $ZIPFILE
    zip -qr $ZIPFILE images
}


function run_tag_version() {
    git tag "v$VERSION"
    git log --graph --decorate
}

if (( $# > 0 )); then
    command=$1
    shift

    case $command in
        'pack')
            run_pack_assets
            ;;
        'tag')
            run_tag_version
            ;;
        *)
            echo "Command \"$command\" unknown."
            echo
            usage
            ;;
    esac
else
    echo 'Please give a command.'
    echo
    usage
fi