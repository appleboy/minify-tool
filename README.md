Web-build-script
================

Compress all css and js files before deploying your web project.

Feature
-------------

* JavaScript compressor: [UglifyJS](https://github.com/mishoo/UglifyJS2)
* CSS compressor: [Sqwish](https://github.com/ded/sqwish)

Installation
-------------

Install [NPM](https://npmjs.org/) and compressor tools via the following script command.

    $ git clone https://github.com/appleboy/web-build-script.git build
    $ chmod +x ./build/install.sh
    $ chmod +x ./build/build.sh
    $ ./build/install.sh

Usage
-------------

Modified the script permission.

    $ chmod +x ./build/build.sh

Deploying web project on same folder.

    $ ./build/build.sh your_project_folder_path

Deploying web project to another folder.

    $ ./build/build.sh your_project_folder_path -o output_folder_path

Author
-------------

Bo-Yi Wu, Twitter: [@appleboy](http://twitter.com/appleboy "Twitter"), Blog: http://blog.wu-boy.com