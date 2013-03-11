#!/usr/bin/env bash

#########################################################
# Date: 2013/02/21
# Author: appleboy ( appleboy.tw AT gmail.com)
# Web: http://blog.wu-boy.com
#
# Program:
# Minify all css and js files
# before deploying your web project.
#########################################################

version='1.1'
print_version() {
    echo "Web build tool (c) 2013 by Bo-Yi Wu, version $version"
}

usage() {
    print_version
    echo
    echo "Usage: $0 [[-o | --output] output_folder] [minify_path|script_file]"
    echo "options:"
    echo "--output | -o output_folder set output build folder"
    echo "--version | -v              show version number"
    echo "--help | -h                 usage message"
    exit 0
}

command() {
    echo "=> You are not install sqwish or uglifyjs."
    echo "=> Please install node command line tool first."
    exit
}

output() {
    case $2 in
        'ok')
            color='32'
            ;;
        'error')
            color='31'
            ;;
        *)
            color='33'
            ;;
    esac
    printf "\E[0;${color};40m"
    echo -n $1
    printf "\E[0m"
}

display() {
    echo -n '['
    output $2 $2
    echo -n '] minify the file: '
    output $1
    echo
}

minify_script() {
    case $2 in
        'js')
            uglifyjs $1 -m -o $1 1> /dev/null 2>&1
            if [ $? -ne 0 ]; then
                display $1 'error'
            else
                display $1 'ok'
            fi
            ;;
        'css')
            sqwish $1 -o $1 1> /dev/null 2>&1
            if [ $? -ne 0 ]; then
                display $1 'error'
            else
                display $1 'ok'
            fi
            ;;
    esac
}

which sqwish 1> /dev/null 2>&1
[ $? -ne 0 ] && command

which uglifyjs 1> /dev/null 2>&1
[ $? -ne 0 ] && command

# Process command line...
while [ $# -gt 0 ]; do
    case $1 in
        --help | -h)
            usage $0
            ;;
        --version | -v)
            print_version
            exit 0
            ;;
        --output | -o)
            shift
            output_folder=$1
            shift
            ;;
        *)
            minify_path=$1
            shift
            ;;
    esac
done

[ -z $minify_path ] && usage $0
minify_path=$(echo $minify_path | sed 's/\/+$//g')
[ -z $output_folder ] && output_folder=$minify_path

# copy all file to output folder if minify_path is not equal output_folder
if [ $minify_path != $output_folder ]; then
    if [ -e $output_folder ]; then
        read -p "Do you want to delete ${output_folder} folder [y/n]: " confirm
        test $confirm = "y" -o $confirm = "Y" && rm -rf $output_folder
    fi
    [ -e $output_folder ] && cp -arv ${minify_path}/* ${output_folder}/
    [ -e $output_folder ] || cp -arv ${minify_path} ${output_folder}
fi

if [ -f $minify_path ]; then
    extension=$(echo $minify_path | awk -F . '{print $NF}')
    minify_script $minify_path $extension
    exit 1;
fi

# find all js and css file
file_list=$(find $output_folder -type f -type f | grep -e '\.\(js\|css\)$')

for row in $file_list
do
    extension=$(echo $row | awk -F . '{print $NF}')
    minify_script $row $extension
done
