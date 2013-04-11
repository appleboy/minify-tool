Web Minify Tool
================

Minify all html, css and js files before deploying your web project.

Feature
-------------

* JavaScript compressor: [UglifyJS](https://github.com/mishoo/UglifyJS2)
* CSS compressor: [Sqwish](https://github.com/ded/sqwish)
* html compressor: [htmlcompressor](http://code.google.com/p/htmlcompressor/)

Installation
-------------

Install [NPM](https://npmjs.org/) and compressor tools via the following script command.

    $ git clone https://github.com/appleboy/web-build-script.git build
    $ chmod +x install.sh
    $ chmod +x minify

Install CSS and JavaScript minify tool.

    $ ./install.sh

Usage
-------------

Minify single html, css or javascript file.

    $ ./minify single_file_path

Minify web project on same folder.

    $ ./minify your_project_folder_path

Minify web project to another folder.

    $ ./minify your_project_folder_path -o output_folder_path

UNIX Command
-------------

Copy minify to /usr/bin folder

    $ cp ./minify /usr/bin/minify

Author
-------------

Bo-Yi Wu, Twitter: [@appleboy](http://twitter.com/appleboy "Twitter"), Blog: http://blog.wu-boy.com
