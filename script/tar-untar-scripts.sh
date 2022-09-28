#!/bin/sh

set -e

TAR_FILE=$1
UNTAR_DIR=$2
BASE_FILE_NAME=""

function untarfiles() {
  if [ -n $TAR_FILE ] && [ -n $UNTAR_DIR ]; then
    echo "Extracting files....."
    getBaseFileName $TAR_FILE
    echo "name ---- $BASE_FILE_NAME"
    mkdir -p $UNTAR_DIR$BASE_FILENAME
    tar -xvf $TAR_FILE -C $UNTAR_DIR$BASE_FILENAME
    rm -rf $TAR_FILE
#    untarEachSubDirFiles $UNTAR_DIR$TAR_FILE_NAME
  else
    echo "Nothing to extract......"
  fi
}

function untarEachSubDirFiles() {
  if [ -n $1 ]; then
    cd $1
    tarfilelist=(`find . -maxdepth 1 -iname "*.tar"`)
    for file in "${filelist[@]}"
    do
      getBaseFileName $file
      mkdir -p $BASE_FILENAME
      tar -xvf $file -C $BASE_FILENAME
      rm -rf $file
      untarEachSubDirFiles ./$BASE_FILENAME
    done
    cd ..
  else
    echo "Nothing to extract in the sub directory....."
  fi
}

function getBaseFileName() {
  fullpath=$1
  echo "full path is ---- $fullpath"
  if [ -n $fullpath ]; then
    filename="${fullpath##*/}"                      # Strip longest match of */ from start
    dir="${fullpath:0:${#fullpath} - ${#filename}}" # Substring from 0 thru pos of filename
    base="${filename%.[^.]*}"                       # Strip shortest match of . plus at least one non-dot char from end
    ext="${filename:${#base} + 1}"                  # Substring from len of base thru end
    if [[ -z "$base" && -n "$ext" ]]; then          # If we have an extension and no base, it's really the base
      base=".$ext"
      ext=""
    fi
    echo -e "$fullpath:\n\tdir  = \"$dir\"\n\tbase = \"$base\"\n\text  = \"$ext\""
    BASE_FILE_NAME=$base
  else
    echo "No file found...."
  fi
}
