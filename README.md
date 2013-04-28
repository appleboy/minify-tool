Web Minify Tool
================

Minify all html, css, js and optimize image files for web project.

Feature
-------------

* JavaScript compressor: [UglifyJS](https://github.com/mishoo/UglifyJS2)
* CSS compressor: [Sqwish](https://github.com/ded/sqwish)
* Html compressor: [htmlcompressor](http://code.google.com/p/htmlcompressor/)
* Optimize images: [image_optim](https://github.com/toy/image_optim)

Installation
-------------

Install [NPM](https://npmjs.org/) and compressor tools via the following script command.

    $ git clone https://github.com/appleboy/minify-tool.git build
    $ chmod +x install.sh
    $ chmod +x minify

Install Html, CSS and JavaScript minify tool.

    $ ./install.sh

Usage
-------------

Minify image files (include *.jpg, *.png, *.gif).

    $ ./minify -t image image_folder_path

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
