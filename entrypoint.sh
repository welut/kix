#!/bin/sh -l

set -eu

apt-get update && apt-get install -y \
  ant \
  git \
  openjdk-8-jdk

git clone $1

cp -r src/** src/

ant clean
ant extensions -Dproguard=1
cd out
file=$(dir)
echo ::set-output name=file::$file

cd ..
