#!/bin/sh -l

set -eu

apt-get update && apt-get install -y \
  ant \
  git \
  openjdk-8-jdk

git clone $1

cp -r src/** extension-template/src/

cd extension-template/

ant clean
ant extensions -Dproguard=1

cd ../

cd extension-template/out
ls
file=$(dir)
echo ::set-output name=file::$file

cd ../
