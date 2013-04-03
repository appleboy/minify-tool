#!/usr/bin/env bash

#########################################################
# Date: 2013/02/21
# Author: appleboy ( appleboy.tw AT gmail.com)
# Web: http://blog.wu-boy.com
#
# Program:
# Install css and javascript compressor tool.
#########################################################

##
# install npm command
##

output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}

which npm 1> /dev/null 2>&1
if [ $? -ne 0 ]; then
    output '=> install nvm tool'
    curl https://raw.github.com/appleboy/nvm/develop/install.sh | sh
    . $HOME/.nvm/nvm.sh # This loads NVM
    output '=> install node.js stable version'
    nvm install stable
    output '=> use node.js stable version'
    nvm use stable
fi

output '=> install UglifyJS 2 node-based js compressor.'
which uglifyjs 1> /dev/null 2>&1 || npm install -g uglify-js
output '=> install sqwish node-based CSS compressor.'
which sqwish 1> /dev/null 2>&1 || npm install -g sqwish

echo
echo '============================================='
echo 'Install node-based tool completely.'
echo '============================================='
echo