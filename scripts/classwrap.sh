#!/bin/bash

# Set up classpath and invoke 'java' with it

set -eu
root=$(dirname $0)/..

cp=""
# Eclipse and IDEA defaults
cp=$cp:$root/bin
cp=$cp:$root/out/production/ark-tweet-nlp
# our build dir from "compile.sh"
cp=$cp:$root/mybuild
cp=$cp:$root/ark-tweet-nlp/target/classes
# Jar dependencies
cp=$cp:$(find $root/lib $root/ark-tweet-nlp/target -name '*.jar' | tr '\n' :)
case $OSTYPE in
cygwin*|msys)
	cp=$(echo $cp | tr ':' ';')
	;;
esac
set -x
exec java -ea -cp "$cp" "$@"
