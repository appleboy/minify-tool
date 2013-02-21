#!/usr/bin/env bash

##
# install npm command
##

which npm 1> /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo '=> install nvm tool'
    curl https://raw.github.com/appleboy/nvm/develop/install.sh | sh
    . $HOME/.nvm/nvm.sh # This loads NVM
    echo '=> install node.js stable version'
    nvm install stable
    echo '=> use node.js stable version'
    nvm use stable
fi

echo '=> install UglifyJS 2 node-based js compressor.'
npm install -g uglify-js
echo '=> install sqwish node-based CSS compressor.'
npm install -g sqwish