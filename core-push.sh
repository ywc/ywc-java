#!/bin/bash

export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd $SCRIPT_DIR/../ywc;
export YWC_HOME=`pwd`;
export JAVA_DIR=ywc.core/ywc.java;

cp $YWC_HOME/$JAVA_DIR/ywc.frontend/dist/ywc.frontend.war $SCRIPT_DIR/ywc.frontend.war;
cp $YWC_HOME/$JAVA_DIR/ywc.backend.ws/dist/ywc.backend.ws.war $SCRIPT_DIR/ywc.backend.ws.war;
cp -R $YWC_HOME/$JAVA_DIR/ywc.backend.d/dist /tmp/ywc_backend_d;
cd /tmp;
tar -zvcf ywc_backend_d.tar.gz ywc_backend_d;
cp /tmp/ywc_backend_d.tar.gz $SCRIPT_DIR/ywc.backend.d.tar.gz;
rm -R /tmp/ywc_backend_d /tmp/ywc_backend_d.tar.gz;

cd $SCRIPT_DIR;
git add .;
git commit -m "Latest version";

git checkout gh-pages;
git merge master -m "Latest version merged into gh-pages";
git push;
git checkout master;
git push;