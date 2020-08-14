#!/bin/sh -l

set -eu

apt-get update && apt-get install -y \
  ant \
  git \
  openjdk-8-jdk

git clone $1
git submodule update --init

cp -r src/** appinventor-extensions/appinventor/components/src

cd appinventor-extensions/appinventor/
ant clean
ant MakeAuthKey
ant extensions -Dproguard=1

cd ../..

cd appinventor-extensions/appinventor/components/build/extensions
file=$(dir)
echo ::set-output name=file::$file

cd ../../../../..
