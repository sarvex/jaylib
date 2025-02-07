#!/bin/bash

rm javacpp.jar
jar xf jaylib-natives-macosx-x86_64-*.jar
rm jaylib-natives-macosx-x86_64-*.jar
jar xf jaylib-natives-linux-x86_64-*.jar
rm jaylib-natives-linux-x86_64-*.jar
jar xf jaylib-natives-windows-x86_64-*.jar
rm jaylib-natives-windows-x86_64-*.jar
jar xf jaylib-natives-linux-armhf-*.jar
rm jaylib-natives-linux-armhf-*.jar
jar uf jaylib-4.2.0-1.jar com

rm -rf com META-INF
cp ~/IdeaProjects/jaylib/*.pom .

for FILE in *.jar *.pom
do
    md5sum $FILE > $FILE.md5
    sha1sum $FILE > $FILE.sha1
    sha512sum $FILE > $FILE.sha512
    sha256sum $FILE > $FILE.sha256
    gpg -ab $FILE
done

jar -cvf bundle.jar *