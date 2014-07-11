#!/usr/bin/env bash

#########################################################
# Date: 2013/02/21
# Author: appleboy ( appleboy.tw AT gmail.com)
# Web: http://blog.wu-boy.com
#
# Program:
# Install css and javascript compressor tool.
#########################################################

machine=$(uname -m)

output() {
    printf "\E[0;33;40m"
    echo $1
    printf "\E[0m"
}

# install image optimize tool
install_image_optim() {
    output '=> install image optimize tool for Linux - Debian/Ubuntu.'
    which aptitude 1> /dev/null 2>&1 && sudo aptitude -y install advancecomp gifsicle jpegoptim libjpeg-progs optipng pngcrush
    output '=> install image optimize tool for Linux - RHEL/Fedora/Centos.'
    which yum 1> /dev/null 2>&1 && sudo yum install -y advancecomp gifsicle libjpeg optipng

    # install jpegoptim tool
    which jpegoptim 1> /dev/null 2>&1
    if [ $? -ne 0 ]; then
        which aptitude 1> /dev/null 2>&1 && sudo aptitude -y install libjpeg8 libjpeg8-dev
        which yum 1> /dev/null 2>&1 && sudo yum install -y libjpeg-turbo-devel
        sudo cd /tmp && curl -O http://www.kokkonen.net/tjko/src/jpegoptim-1.3.0.tar.gz && tar zxf jpegoptim-1.3.0.tar.gz && cd jpegoptim-1.3.0 && ./configure && make && make install
    fi

    # install pngcrush tool
    which pngcrush 1> /dev/null 2>&1
    if [ $? -ne 0 ]; then
        sudo cd /tmp && curl -O http://iweb.dl.sourceforge.net/project/pmt/pngcrush/1.7.58/pngcrush-1.7.58.tar.gz && tar zxf pngcrush-1.7.58.tar.gz && cd pngcrush-1.7.58 && make && cp -af pngcrush /usr/local/bin
    fi

    # install pngout tool
    which pngout 1> /dev/null 2>&1
    if [ $? -ne 0 ]; then
        sudo cd /tmp && curl -O http://static.jonof.id.au/dl/kenutils/pngout-20130221-linux.tar.gz && tar zxf pngout-20130221-linux.tar.gz
        case $machine in
            'x86_64')
                sudo cd /tmp/pngout-20130221-linux && cp -rf x86_64/pngout /usr/local/bin
                ;;
        esac
    fi

    # install Optimize images using multiple utilities
    # ref: https://github.com/toy/image_optim
    sudo gem install image_optim
}

##
# install npm command
##

which npm 1> /dev/null 2>&1
if [ $? -ne 0 ]; then
    output '=> install nvm tool'
    curl https://raw.github.com/creationix/nvm/master/install.sh | sh
    . $HOME/.nvm/nvm.sh # This loads NVM
    output '=> install node.js stable version'
    nvm install 0.10.26
    output '=> use node.js stable version'
    nvm use 0.10.26
fi

output '=> install UglifyJS 2 node-based js compressor.'
which uglifyjs 1> /dev/null 2>&1 || npm install -g uglify-js
output '=> install sqwish node-based CSS compressor.'
which sqwish 1> /dev/null 2>&1 || npm install -g sqwish

# fetch htmlcompressor java library
[ -d ~/.htmlcompressor ] || mkdir ~/.htmlcompressor
[ -f ~/.htmlcompressor/htmlcompressor-1.5.3.jar ] || wget https://htmlcompressor.googlecode.com/files/htmlcompressor-1.5.3.jar -O ~/.htmlcompressor/htmlcompressor-1.5.3.jar

# install ruby image optimize tool
output '=> install image optimize tool.'
which image_optim 1> /dev/null 2>&1
[ $? -ne 0 ] && install_image_optim

echo
echo '============================================='
echo 'Install node-based tool completely.'
echo '============================================='
echo
