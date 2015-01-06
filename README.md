# Web Minify Tool

Minify all html, css, js and optimize image files for web project.

## Feature

* JavaScript compressor: [UglifyJS](https://github.com/mishoo/UglifyJS2)
* CSS optimizer: [CSSO](https://www.npmjs.com/package/csso)
* HTML compressor/minifie: [HTML compressor](https://github.com/kangax/html-minifier)
* Optimize images: [image_optim](https://github.com/toy/image_optim)

## Installation

Install [NPM](https://npmjs.org/) and compressor tools via the following script command.

```bash
$ git clone https://github.com/appleboy/minify-tool.git build
$ cd build && chmod +x install.sh minify
```

Install Html, CSS and JavaScript minify tool.

```bash
$ ./install.sh
```

## Usage

Minify image files (include *.jpg, *.png, *.gif).

```bash
$ ./minify -t image image_folder_path
```

Minify single html, css or javascript file.

```bash
$ ./minify single_file_path
```

Minify web project on same folder.

```bash
$ ./minify your_project_folder_path
```

Minify web project to another folder.

```bash
$ ./minify your_project_folder_path -o output_folder_path
```

## UNIX Command

Copy minify to /usr/bin folder

```bash
$ cp ./minify /usr/bin/minify
```

## Author

Bo-Yi Wu, Twitter: [@appleboy](http://twitter.com/appleboy "Twitter"), Blog: http://blog.wu-boy.com
