<!--@+leo-ver=5-thin-->
<!--@+node:peckj.20130614104551.2206: * @file README.md-->
# ConTeXt-Leo-make
A nice setup for working with ConTeXt projects in Leo, with builds provided by GNU make.

## Overview
This project serves as a nice way of working with ConTeXt projects in Leo, with a build system provided by GNU make.  It embraces the concept of [ConTeXt Project Structure](http://wiki.contextgarden.net/Project_structure), and uses Leo for editing and organization.

## Usage
Usage is pretty simple: open project.leo in Leo, and work away!  Builds are provided by GNU make, so run `make` in a terminal window to get some help with that.

## Notes
The Makefile expects certain things from your setup, namely that your products are in individual directories named `prd_projname_productname`, and that the main .tex file for that product has the same name, within that directory.

Also, the Makefile uses some black magic to allow the `product` shortcut, allowing, for example, `make product asdf` to build `prd_projname_asdf/prd_projname_asdf.tex` into `prd_projname_asdf.pdf`.

## License
[WTFPLv2](http://wtfpl2.com/).  Go wild, kids.
<!--@-leo-->
