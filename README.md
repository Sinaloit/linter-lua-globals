linter-lua-globals
==================

> luac — The luac program parses lua files. It can be used for detecting errors in lua code. See [http://www.lua.org/manual/4.0/luac.html](http://www.lua.org/manual/4.0/luac.html) for more informations about luac.

This package will lint your `.lua` opened files in Atom using a script to find globals.  **It will lint on edit and/or save**, so you'll see instantly if your code has globals you may not be expecting.

The script provided was created originally by [Mikk](http://www.wowace.com/addons/findglobals/)

##Directives in the file:
The following directives in the file turn certain features off in the detection

-- GLOBALS: SomeGlobal, SomeOtherGlobal
  The script will never complain about these. There may be multiple lines of these anywhere in the file, taking effect globally (for now). There is no way to un-GLOBAL an already declared global.

-- SETGLOBALFILE [ON/OFF]
  Enable/disable SETGLOBAL checks in the global scope
  Default: ON
  
-- SETGLOBALFUNC [ON/OFF]
  Enable/disable SETGLOBAL checks in functions. This setting affects the whole file (for now)
  Default: ON
  
-- GETGLOBALFILE [ON/OFF]
  Default: OFF

-- GETGLOBALFUNC [ON/OFF]
  Default: ON

## Linter Installation
Before using this package, you must ensure that `lua` and `luac` are installed on your system.
*: Limitation of this version is that luac must be in the system path

## Installation

* `$ apm install linter` (if you don't have [AtomLinter/Linter](https://github.com/AtomLinter/Linter) installed).
* `$ apm install linter-lua-globals`


## Other available linters
- [linter-lua](https://atom.io/packages/linter-lua), - Linter plugin for lua, using `luac -p`
- [linter-php](https://atom.io/packages/linter-php), for PHP using `php -l`
- [linter-phpcs](https://atom.io/packages/linter-phpcs) - Linter plugin for PHP, using phpcs.
- [linter-phpmd](https://atom.io/packages/linter-phpmd) - Linter plugin for PHP, using phpmd.
- [linter-jshint](https://atom.io/packages/linter-jshint) - Linter plugin for JavaScript, using jshint.
- [linter-scss-lint](https://atom.io/packages/linter-scss-lint) - Sass Linter plugin for SCSS, using scss-lint.
- [linter-coffeelint](https://atom.io/packages/linter-coffeelint) Linter plugin for CoffeeScript, using coffeelint.
- [linter-csslint](https://atom.io/packages/linter-csslint) Linter plugin for CSS, using csslint.
- [linter-rubocop](https://atom.io/packages/linter-rubocop) - Linter plugin for Ruby, using rubocop.
- [linter-tslint](https://atom.io/packages/linter-tslint) Linter plugin for JavaScript, using tslint.